import 'package:flutter/material.dart';

class ServerImage extends StatelessWidget {
  final String url;

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
