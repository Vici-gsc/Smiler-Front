import 'package:flutter/material.dart';

import '../../../ui/service_colors.dart';
import '../atom/smiler_text_button.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final bool disabled;

  const MainButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmilerTextButton(
      onTap: onTap,
      text: text,
      color: disabled ? ServiceColors.secondary : ServiceColors.primaryLight,
      textStyle: Theme.of(context).textTheme.titleSmall,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(15),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
