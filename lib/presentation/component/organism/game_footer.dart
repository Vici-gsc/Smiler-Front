import 'package:flutter/material.dart';
import 'package:smiler/presentation/component/atom/svg_icon_button.dart';
import 'package:smiler/ui/service_assets.dart';

import '../../../ui/service_colors.dart';

class GameFooter extends StatelessWidget {
  final Function() onExitButtonTapped;
  final Function() onSkipButtonTapped;
  final int currentQuestionCount;

  const GameFooter(
      {Key? key,
      required this.onExitButtonTapped,
      required this.onSkipButtonTapped,
      required this.currentQuestionCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: ServiceColors.primaryLight,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgIconButton(
            svgPath: ServiceAssets.exitIcon,
            onTap: onExitButtonTapped,
            color: Colors.red,
            label: "그만하기",
          ),
          Text(
            "$currentQuestionCount문제째 도전 중",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SvgIconButton(
            svgPath: ServiceAssets.skipIcon,
            onTap: onSkipButtonTapped,
            color: Colors.black,
            label: "건너뛰기",
          ),
        ],
      ),
    );
  }
}
