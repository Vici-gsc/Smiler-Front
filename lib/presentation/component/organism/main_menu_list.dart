import 'package:flutter/material.dart';

import '../molecule/main_button.dart';

class MainMenuList extends StatelessWidget {
  final List<MainMenuListItem> items;

  const MainMenuList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: items
            .map((item) => MainButton(text: item.text, onTap: item.onTap))
            .toList(),
      ),
    );
  }
}

class MainMenuListItem {
  final String text;
  final Function() onTap;

  const MainMenuListItem({required this.text, required this.onTap});
}
