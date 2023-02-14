import 'package:flutter/material.dart';
import 'package:smiler/presentation/component/molecule/word_button.dart';

import '../../../ui/service_colors.dart';
import '../atom/server_image.dart';

class EmotionImage extends StatelessWidget {
  final String url;
  final String? emotionName;

  const EmotionImage({Key? key, required this.url, this.emotionName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Positioned.fill(
          child: ServerImage(url: url),
        ),
        if (emotionName != null)
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  WordButton(
                      word: emotionName!, color: ServiceColors.background),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
