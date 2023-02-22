import 'package:flutter/material.dart';

/// 통계의 각 항목을 카드 형태로 보여주는 위젯입니다.
class StatisticsContainer extends StatefulWidget {
  /// 카드의 상단에 위치할 위젯입니다.
  final Widget? upperChild;

  /// 카드의 헤더에 위치할 텍스트입니다.
  final String? header;

  /// 카드의 타이틀에 위치할 텍스트입니다. (필수)
  final String title;

  /// 카드의 설명에 위치할 텍스트입니다.
  final String? description;

  /// 카드의 푸터에 위치할 텍스트입니다.
  final String? footer;

  /// 카드의 하단에 위치할 위젯입니다.
  final Widget? lowerChild;

  /// 등장 애니메이션의 지연 시간입니다.(ms)
  final Duration animationDelay;

  /// 통계의 각 항목을 카드 형태로 보여주는 위젯을 생성합니다.
  ///
  /// [animationDelay]은 기본값으로 0ms가 설정되어 있습니다.
  const StatisticsContainer({
    Key? key,
    this.upperChild,
    this.header,
    required this.title,
    this.description,
    this.footer,
    this.lowerChild,
    this.animationDelay = Duration.zero,
  }) : super(key: key);

  @override
  State<StatisticsContainer> createState() => _StatisticsContainerState();
}

class _StatisticsContainerState extends State<StatisticsContainer>
    with TickerProviderStateMixin {
  late final AnimationController _animController;
  late final Animation<Offset> _animOffset;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animController,
      child: SlideTransition(
        position: _animOffset,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.upperChild != null) widget.upperChild!,
              if (widget.header != null)
                Text(
                  widget.header!,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              if (widget.description != null)
                Text(
                  widget.description!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              if (widget.footer != null)
                Text(
                  widget.footer!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              if (widget.lowerChild != null) widget.lowerChild!,
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animOffset = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animController,
      curve: Curves.easeInOut,
    ));

    Future.delayed(widget.animationDelay, () {
      _animController.forward();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }
}
