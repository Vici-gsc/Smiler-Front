import 'package:flutter/material.dart';

import '../component/organism/main_menu_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                MainMenuListItem(text: "표정 따라하기", onTap: () {}),
                MainMenuListItem(text: "감정 단어 맞추기", onTap: () {}),
                MainMenuListItem(text: "표정 지어보기", onTap: () {}),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
