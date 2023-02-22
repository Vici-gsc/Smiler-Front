import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:smiler/domain/model/question_type.dart';
import 'package:smiler/presentation/component/organism/line_chart.dart';
import 'package:smiler/presentation/component/organism/statistics_container.dart';
import 'package:smiler/presentation/statistics/statistics_state.dart';
import 'package:smiler/presentation/statistics/statistics_view_model.dart';

import '../../domain/model/emotion.dart';
import '../../ui/service_assets.dart';
import '../../ui/service_colors.dart';
import '../component/atom/svg_icon_button.dart';
import '../component/molecule/alert_flush_bar.dart';
import '../component/organism/yes_no_dialog.dart';
import '../main/main_screen.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<StatisticsViewModel>();

    showDeleteDialog() {
      showDialog(
        context: context,
        builder: (dialogContext) => YesNoDialog(
            title: "모든 기록 삭제하기",
            description: "'삭제하기'를 누르면 모든 풀이 기록이 삭제됩니다.\n정말로 삭제하시겠습니까?",
            positiveButtonLabel: "삭제하기",
            negativeButtonLabel: "취소하기",
            onPositiveButtonTap: () {
              viewModel.delete(
                onSuccess: () => AlertFlushBar("기록이 삭제되었습니다.").show(context),
                onError: (error) => AlertFlushBar(error).show(context),
              );
              Navigator.of(dialogContext).pop();
            },
            onNegativeButtonTap: () {
              Navigator.of(dialogContext).pop();
            }),
      );
    }

    return Scaffold(
      backgroundColor: ServiceColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(child: _StatDataWidget(state: viewModel.state)),
                Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: ServiceColors.primaryLight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgIconButton(
                        svgPath: ServiceAssets.exitIcon,
                        color: Colors.red,
                        onTap: () => Navigator.of(context).pop(),
                        label: "나가기",
                      ),
                      SvgIconButton(
                        svgPath: ServiceAssets.trashIcon,
                        onTap: () => showDeleteDialog(),
                        label: "삭제하기",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (viewModel.state.isLoading)
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(child: CircularProgressIndicator()),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<StatisticsViewModel>().load(
        isInit: true,
        onError: (error) {
          // 에러 발생 시 메인 화면으로 이동 및 에러 플러시바 출력
          final mainRoute = MaterialPageRoute(builder: (context) {
            SchedulerBinding.instance.addPostFrameCallback(
              (_) => AlertFlushBar(error).show(context),
            );
            return const MainScreen();
          });

          // 위젯이 바인딩된 이후에 메인 화면으로 이동
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => Navigator.of(context).pushAndRemoveUntil(
              mainRoute,
              (route) => false,
            ),
          );
        });
  }
}

class _StatDataWidget extends StatelessWidget {
  static const _paddingVertical = 40.0;
  static const _paddingHorizontal = 15.0;
  static const _baseDelay = 200;
  final StatisticsState state;

  const _StatDataWidget({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rate = state.totalQuestionCount == 0
        ? 0
        : (100 * state.totalCorrectAnswerCount / state.totalQuestionCount);

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: _paddingVertical,
          horizontal: _paddingHorizontal,
        ),
        child: Column(
          children: [
            // 메인 통계
            StatisticsContainer(
              upperChild: _getTag(context, rate),
              header: "지금까지 ${state.totalQuestionCount}문제중",
              title:
                  "${rate.toStringAsFixed(2)}%(${state.totalCorrectAnswerCount}문제)를 맞췄어요.",
              footer: "* 기록은 ${StatisticsViewModel.statLimit}문제까지만 보여져요.",
            ),
            const SizedBox(height: 30),
            // 감정별 정답률
            StatisticsContainer(
              title:
                  "가장 헷갈렸던 감정은 ${state.worstEmotion?.koreanName ?? "..."} ${state.worstEmotion?.emoji ?? ""}",
              description:
                  "${state.correctRateByEmotion[state.worstEmotion]?.toStringAsFixed(2) ?? "0"}%의 정답률을 기록했어요.",
              lowerChild: LineChart<Emotion>(
                data: state.correctRateByEmotion,
                keyFormatter: (e) => e.koreanName,
              ),
              animationDelay: const Duration(milliseconds: _baseDelay),
            ),
            const SizedBox(height: 30),
            // 문제 유형별 정답률
            StatisticsContainer(
              title: "${state.bestQuestionType?.name ?? "..."}의 달인이신가요?",
              description:
                  "${state.correctRateByQuestionType[state.bestQuestionType]?.toStringAsFixed(2) ?? "0"}%의 정답률을 기록했어요.",
              lowerChild: LineChart<QuestionType>(
                data: state.correctRateByQuestionType,
                keyFormatter: (e) => e.name,
              ),
              animationDelay: const Duration(milliseconds: _baseDelay * 2),
            ),
            const SizedBox(height: 30),
            // 꼬리말
            const StatisticsContainer(
              title: "풀이를 할수록 통계가 정확해져요.",
              description: "Smiler와 함께 감정 마스터가 되어보아요!",
              animationDelay: Duration(milliseconds: _baseDelay * 3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getTag(BuildContext context, num rate) {
    final String text = _getTagText(rate);

    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: ServiceColors.primaryLight,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }

  String _getTagText(num rate) {
    if (rate > 80) {
      return "🏆 감정 마스터";
    } else if (rate > 60) {
      return "🎓 감정 박사";
    } else if (rate > 40) {
      return "🧐 감정 분석가";
    } else if (rate > 20) {
      return "🏹 감정 사냥꾼";
    } else {
      return "🐥 감정 병아리";
    }
  }
}
