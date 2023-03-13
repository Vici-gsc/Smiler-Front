import 'package:flutter/material.dart';

import '../molecule/main_button.dart';

/// 메인 화면의 메뉴 리스트를 표시하는 위젯입니다.
class MainMenuList extends StatelessWidget {
  /// 메뉴 리스트의 아이템들입니다.
  final List<MainMenuListItem> items;

  /// 메인 화면의 메뉴 리스트를 표시하는 위젯을 생성합니다.
  ///
  /// [items]는 메뉴 리스트의 아이템들입니다.
  /// 자세한 사항은 [MainMenuListItem] 클래스를 참고하세요.
  const MainMenuList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: items
            .map((item) => MainButton(
                text: item.text, onTap: item.onTap, disabled: item.disabled))
            .toList(),
      ),
    );
  }
}

/// 메인 화면의 메뉴 리스트의 아이템을 표현하는 클래스입니다.
class MainMenuListItem {
  /// 아이템의 텍스트입니다.
  final String text;

  /// 아이템을 눌렀을 때 호출되는 콜백입니다.
  final Function() onTap;

  /// 아이템이 비활성화되어 있는지 여부입니다.
  final bool disabled;

  /// 메인 화면의 메뉴 리스트의 아이템을 표현하는 클래스를 생성합니다.
  ///
  /// [disabled]가 true인 경우 버튼의 색이 회색으로 바뀝니다. onTap은 정상 작동합니다.
  const MainMenuListItem({
    required this.text,
    required this.onTap,
    this.disabled = false,
  });
}
