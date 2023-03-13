import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:smiler/ui/service_colors.dart';

/// 화면 상단에 표시되는 알림 위젯입니다.
class AlertFlushBar {
  late final Flushbar flushBar;

  /// [message]를 표시하는 알림 위젯을 생성합니다.
  ///
  /// 보통 [show] 메서드와 함께 사용합니다.
  AlertFlushBar(String message) {
    flushBar = Flushbar(
      message: message,
      icon: const Icon(
        Icons.info_outline,
        size: 28,
        color: ServiceColors.alertRed,
      ),
      flushbarPosition: FlushbarPosition.TOP,
      animationDuration: const Duration(milliseconds: 300),
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(10),
    );
  }

  /// 알림을 화면에 표시합니다.
  void show(BuildContext context) {
    flushBar.show(context);
  }
}
