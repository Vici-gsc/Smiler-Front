import 'package:flutter/material.dart';
import 'package:smiler/presentation/component/atom/svg_icon_button.dart';
import 'package:smiler/ui/service_assets.dart';

import '../../../ui/service_colors.dart';

/// 게임 화면 하단에 위치하는 푸터 위젯입니다.
class GameFooter extends StatelessWidget {
  /// 게임을 종료하는 버튼을 눌렀을 때 호출되는 콜백입니다.
  final Function() onExitButtonTapped;

  /// 문제를 건너뛰는 버튼을 눌렀을 때 호출되는 콜백입니다.
  final Function() onSkipButtonTapped;

  /// 현재까지 진행한 문제의 수입니다.
  final int currentQuestionCount;

  /// 게임 화면 하단에 위치하는 푸터 위젯을 생성합니다.
  const GameFooter({
    Key? key,
    required this.onExitButtonTapped,
    required this.onSkipButtonTapped,
    required this.currentQuestionCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: ServiceColors.primaryLight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgIconButton(
            svgPath: ServiceAssets.exitIcon,
            onTap: onExitButtonTapped,
            color: Colors.red,
            label: "그만하기",
          ),
          Text(
            "${currentQuestionCount + 1}문제째 도전 중",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SvgIconButton(
            svgPath: ServiceAssets.skipIcon,
            onTap: onSkipButtonTapped,
            color: Colors.black,
            label: "건너뛰기",
          ),
        ],
      ),
    );
  }
}
