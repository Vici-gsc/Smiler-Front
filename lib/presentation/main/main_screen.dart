import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smiler/presentation/component/atom/svg_icon_button.dart';
import 'package:smiler/presentation/main/main_view_model.dart';
import 'package:smiler/ui/service_assets.dart';

import '../../ui/service_colors.dart';
import '../component/organism/main_menu_list.dart';
import '../component/organism/yes_no_dialog.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();

    showHelpDialog() {
      showDialog(
        context: context,
        builder: (dialogContext) => YesNoDialog(
            title: "Smiler는 표정을 연습하는 서비스입니다.",
            description:
                "표정 따라하기: 사진의 표정을 따라해보아요.\n감정 단어 맞추기: 사진을 보고 감정을 맞춰보아요.\n표정 지어보기: 감정에 맞는 표정을 지어보아요.",
            negativeButtonLabel: "닫기",
            onNegativeButtonTap: () {
              Navigator.of(dialogContext).pop();
            }),
      );
    }

    return Scaffold(
      backgroundColor: ServiceColors.background,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      "Smiler",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SvgIconButton(
                    svgPath: ServiceAssets.helpIcon,
                    onTap: () => showHelpDialog(),
                  ),
                ],
              ),
              MainMenuList(items: [
                MainMenuListItem(
                    text: "표정 따라하기",
                    onTap: () {
                      viewModel.onFaceImitatingMenuTapped(context);
                    },
                    disabled: !viewModel.canUseCamera),
                MainMenuListItem(
                    text: "감정 단어 맞추기",
                    onTap: () {
                      viewModel.onWordChoiceMenuTapped(context);
                    }),
                MainMenuListItem(
                    text: "표정 지어보기",
                    onTap: () {
                      viewModel.onFaceExpressionMenuTapped(context);
                    },
                    disabled: !viewModel.canUseCamera),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
  }

  /// 인터넷 연결을 확인하는 함수
  void _checkConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      // 인터넷 연결이 없을 경우 위젯이 바인딩 된 후 다이얼로그 표시
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => showDialog(
          context: context,
          builder: (dialogContext) => YesNoDialog(
              title: "Smiler을 이용하려면 인터넷 연결이 필요해요.",
              description: "WIFI나 5G, LTE를 켜주세요.",
              negativeButtonLabel: "닫기",
              onNegativeButtonTap: () {
                Navigator.of(dialogContext).pop();
              }),
        ),
      );
    }
  }
}
