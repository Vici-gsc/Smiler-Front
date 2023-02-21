import 'package:flutter/material.dart';

/// 서버에서 불러온 이미지를 표시하는 위젯입니다.
class ServerImage extends StatelessWidget {
  /// 이미지의 URL입니다.
  final String url;

  /// 서버에서 불러온 이미지를 표시하는 위젯을 생성합니다.
  ///
  /// [url]은 이미지의 URL입니다. 반드시 null이 아닌 값으로 지정해야 합니다.
  const ServerImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder: (context, widget, progress) {
        if (progress == null) return widget;
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
