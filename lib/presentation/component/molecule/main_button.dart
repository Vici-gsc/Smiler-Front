import 'package:flutter/material.dart';

import '../../../ui/service_colors.dart';
import '../atom/smiler_text_button.dart';

class MainButton extends StatelessWidget {
  final String text;
  final Function() onTap;

  const MainButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmilerTextButton(
      onTap: onTap,
      text: text,
      color: ServiceColors.primaryLight,
      textStyle: Theme.of(context).textTheme.titleSmall,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(15),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
