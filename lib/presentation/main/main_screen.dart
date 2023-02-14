import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smiler/presentation/main/main_view_model.dart';

import '../../ui/service_colors.dart';
import '../component/organism/main_menu_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

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
}
