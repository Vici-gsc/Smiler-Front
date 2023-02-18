import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:smiler/ui/service_colors.dart';

class AlertFlushBar {
  late final Flushbar flushBar;

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
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(10),
      borderRadius: BorderRadius.circular(10),
    );
  }

  void show(BuildContext context) {
    flushBar.show(context);
  }
}
