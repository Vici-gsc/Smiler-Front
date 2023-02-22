import 'package:flutter/material.dart';
import 'package:smiler/presentation/component/atom/line_chart_line.dart';
import 'package:smiler/ui/service_colors.dart';

/// 막대 그래프를 그리는 위젯입니다.
class LineChart<T1> extends StatelessWidget {
  static const double _lineHeight = 25.0;

  /// 그래프에 표시할 데이터입니다.
  final Map<T1, num> data;

  /// key의 형식을 String로 바꿔주는 함수입니다.
  final String Function(T1)? keyFormatter;

  /// 그래프의 가잔 진한 색상입니다.
  final Color accentColor;

  /// 그래프의 가장 연한 색상입니다.
  final Color baseColor;

  /// 막대 그래프를 그리는 위젯입니다.
  ///
  /// [data]는 그래프에 표시할 데이터입니다.
  /// [keyFormatter]는 데이터의 형식을 double로 바꿔주는 함수입니다.
  /// 막대의 색상은 [accentColor]부터 [baseColor]까지 순차적으로 표시됩니다.
  const LineChart({
    Key? key,
    required this.data,
    this.keyFormatter,
    this.accentColor = ServiceColors.primary,
    this.baseColor = ServiceColors.secondary,
  })  : assert(keyFormatter != null || T1 == String,
            "String이 아닌 key는 keyFormatter를 지정해야 합니다."),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final keys = data.keys.toList();
    keys.sort((a, b) => data[b]!.compareTo(data[a]!));

    const num maxValue = 100;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (final key in keys)
                Container(
                  alignment: Alignment.centerRight,
                  height: _lineHeight,
                  child: Text(
                    keyFormatter != null ? keyFormatter!(key) : key as String,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                )
            ],
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < keys.length; i++)
                  LineChartLine(
                    height: _lineHeight,
                    ratio: data[keys[i]]! / maxValue,
                    color: Color.alphaBlend(
                      accentColor.withOpacity(1 - i / (keys.length - 1)),
                      baseColor.withOpacity(i / (keys.length - 1)),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
