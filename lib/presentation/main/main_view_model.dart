import 'package:flutter/material.dart';
import 'package:smiler/presentation/expression/expression_screen.dart';
import 'package:smiler/presentation/imitating/imitating_screen.dart';
import 'package:smiler/presentation/word/word_screen.dart';

class MainViewModel with ChangeNotifier {
  void onFaceImitatingMenuTapped(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ImitatingScreen(),
      ),
    );
  }

  void onWordChoiceMenuTapped(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const WordScreen(),
      ),
    );
  }

  void onFaceExpressionMenuTapped(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ExpressionScreen(),
      ),
    );
  }
}
