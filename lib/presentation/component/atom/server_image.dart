import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../ui/service_colors.dart';

/// 서버에서 불러온 이미지를 표시하는 위젯입니다.
class ServerImage extends StatelessWidget {
  /// 이미지의 URL입니다.
  final String? url;

  /// 서버에서 불러온 이미지를 표시하는 위젯을 생성합니다.
  ///
  /// [url]은 이미지의 URL입니다. 반드시 null이 아닌 값으로 지정해야 합니다.
  const ServerImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return url == null
        ? Shimmer.fromColors(
            baseColor: ServiceColors.shimmerBase,
            highlightColor: ServiceColors.shimmerHighlight,
            period: const Duration(milliseconds: 1000),
            child: Container(color: Colors.white),
          )
        : Image.network(
            url!,
            fit: BoxFit.cover,
            loadingBuilder: (context, widget, progress) => progress == null
                ? widget
                : Shimmer.fromColors(
                    baseColor: ServiceColors.shimmerBase,
                    highlightColor: ServiceColors.shimmerHighlight,
                    period: const Duration(milliseconds: 1000),
                    child: widget,
                  ),
            errorBuilder: (context, error, stackTrace) => Container(
              color: ServiceColors.background,
              child: Center(
                child: Text(
                  '이미지를 불러올 수 없습니다.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: ServiceColors.wrongRed),
                ),
              ),
            ),
          );
  }
}
