import 'package:flutter/material.dart';
import 'package:smiler/presentation/component/molecule/word_button.dart';

import '../atom/server_image.dart';

/// 감정 이미지와 필요에 따라 감정 단어를 표시하는 위젯입니다.
class EmotionImage extends StatelessWidget {
  /// 이미지의 URL입니다.
  final String? url;

  /// 감정 단어입니다.
  final String? emotionName;

  /// 감정 이미지와 필요에 따라 감정 단어를 표시하는 위젯입니다.
  ///
  /// [url]은 이미지의 url이고, [emotionName]은 감정 단어입니다.
  /// [url]이 null인 경우 로딩을 표시합니다.
  const EmotionImage({
    Key? key,
    required this.url,
    this.emotionName,
  }) : super(key: key);

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
                    word: emotionName!,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
