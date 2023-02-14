import 'package:flutter/material.dart';
import 'package:smiler/presentation/expression/expression_screen.dart';
import 'package:smiler/presentation/imitating/imitating_screen.dart';
import 'package:smiler/presentation/word/word_screen.dart';

class MainViewModel with ChangeNotifier {
  static const snackBar = SnackBar(
    content: Text("카메라를 사용할 수 없어 실행할 수 없습니다."),
  );
  final bool canUseCamera;

  MainViewModel(this.canUseCamera);

  void onFaceImitatingMenuTapped(BuildContext context) {
    if (canUseCamera) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ImitatingScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void onWordChoiceMenuTapped(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const WordScreen(),
      ),
    );
  }

  void onFaceExpressionMenuTapped(BuildContext context) {
    if (canUseCamera) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ExpressionScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
