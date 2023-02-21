import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smiler/presentation/main/main_view_model.dart';

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

    return Scaffold(
      backgroundColor: ServiceColors.background,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Smiler",
                style: Theme.of(context).textTheme.titleLarge,
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

  void _checkConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
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
