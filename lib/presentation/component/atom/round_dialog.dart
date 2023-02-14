import 'package:flutter/material.dart';

class RoundDialog extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  const RoundDialog({Key? key, this.child, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(10),
        child: child,
      ),
    );
  }
}
