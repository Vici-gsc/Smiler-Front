import 'package:flutter/material.dart';
import 'package:smiler/presentation/component/molecule/modal_button.dart';

import '../../../ui/service_colors.dart';
import '../atom/round_dialog.dart';

/// 사용자에게 제목, 설명과 Yes/No 선택지를 보여주는 다이얼로그입니다.
class YesNoDialog extends StatelessWidget {
  /// 다이얼로그의 제목입니다.
  final String title;

  /// 다이얼로그의 설명입니다.
  final String description;

  /// 다이얼로그의 긍정 버튼의 라벨입니다.
  final String? positiveButtonLabel;

  /// 다이얼로그의 부정 버튼의 라벨입니다.
  final String negativeButtonLabel;

  /// 다이얼로그의 긍정 버튼을 눌렀을 때 호출되는 콜백입니다.
  final Function()? onPositiveButtonTap;

  /// 다이얼로그의 부정 버튼을 눌렀을 때 호출되는 콜백입니다.
  final Function() onNegativeButtonTap;

  /// 사용자에게 제목, 설명과 Yes/No 선택지를 보여주는 다이얼로그를 생성합니다.
  ///
  /// 보통 [showDialog]와 함께 사용합니다. [YesNoDialog]에는 최소 1개의 버튼이 필요합니다.
  /// [positiveButtonLabel] 및 [onPositiveButtonTap]은 null일 수 있으나,
  /// [negativeButtonLabel] 및 [onNegativeButtonTap]은 null일 수 없음에 유의해주세요.
  const YesNoDialog(
      {Key? key,
      required this.title,
      required this.description,
      this.positiveButtonLabel,
      required this.negativeButtonLabel,
      this.onPositiveButtonTap,
      required this.onNegativeButtonTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundDialog(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          IntrinsicWidth(
            child: Row(
              children: [
                if (positiveButtonLabel != null)
                  Expanded(
                    child: ModalButton(
                      text: positiveButtonLabel!,
                      color: ServiceColors.cautionRed,
                      onTap: () => onPositiveButtonTap?.call(),
                    ),
                  ),
                if (positiveButtonLabel != null) const SizedBox(width: 5),
                Expanded(
                  child: ModalButton(
                    text: negativeButtonLabel,
                    color: ServiceColors.secondary,
                    onTap: onNegativeButtonTap,
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
