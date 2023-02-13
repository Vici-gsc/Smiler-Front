import 'package:flutter/material.dart';
import 'package:smiler/presentation/component/molecule/modal_button.dart';

import '../../../ui/service_colors.dart';

class SmilerModal extends StatelessWidget {
  final String title;
  final String description;
  final String positiveButtonLabel;
  final String negativeButtonLabel;
  final Function() onPositiveButtonTap;
  final Function() onNegativeButtonTap;

  const SmilerModal(
      {Key? key,
      required this.title,
      required this.description,
      required this.positiveButtonLabel,
      required this.negativeButtonLabel,
      required this.onPositiveButtonTap,
      required this.onNegativeButtonTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Padding(
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
                  Expanded(
                    child: ModalButton(
                      text: positiveButtonLabel,
                      color: ServiceColors.cautionRed,
                      onTap: onPositiveButtonTap,
                    ),
                  ),
                  const SizedBox(width: 5),
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
      ),
    );
  }
}
