import 'package:flutter/material.dart';

import '../../../ui/service_colors.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ServiceColors.primaryLight,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(5),
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(text, style: Theme.of(context).textTheme.titleSmall),
      ),
    );
  }
}
