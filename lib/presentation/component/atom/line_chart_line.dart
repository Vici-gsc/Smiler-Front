import 'package:flutter/material.dart';
import 'package:smiler/ui/service_colors.dart';

/// 막대 그래프의 막대를 그리는 위젯입니다.
class LineChartLine extends StatefulWidget {
  /// 막대 그래프의 너비 비율입니다. (0.0 ~ 1.0)
  final double ratio;
  final double height;
  final Color color;

  /// 막대 그래프의 막대를 그리는 위젯을 생성합니다. 애니메이션을 포함합니다.
  ///
  /// [ratio]는 막대 그래프의 너비 비율입니다. (0.0 ~ 1.0)
  /// [height]는 막대 그래프의 높이이며, 10보다 커야 합니다. [color]은 막대의 색상입니다.
  const LineChartLine(
      {Key? key,
      required this.ratio,
      required this.height,
      required this.color})
      : assert(ratio >= 0.0 && ratio <= 1.0, "ratio는 0.0 ~ 1.0 사이여야 합니다."),
        assert(height > 10, "height는 10보다 커야 합니다."),
        super(key: key);

  @override
  State<LineChartLine> createState() => _LineChartLineState();
}

class _LineChartLineState extends State<LineChartLine> {
  double currentRatio = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return AnimatedContainer(
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.symmetric(vertical: 3),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(3),
        ),
        height: widget.height - 6,
        width: constraints.maxWidth * currentRatio,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeOut,
        child: Text(
          "${(widget.ratio * 100).round()}% ",
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.apply(color: ServiceColors.secondaryText),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 800), () {
        setState(() {
          currentRatio = widget.ratio;
        });
      });
    });
  }
}
