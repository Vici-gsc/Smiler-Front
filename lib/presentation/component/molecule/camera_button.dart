import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smiler/ui/service_assets.dart';

import '../../../ui/service_colors.dart';

/// 카메라 아이콘이 있는 버튼 위젯입니다.
class CameraButton extends StatelessWidget {
  final Function() onTap;

  /// 카메라 아이콘이 있는 버튼 위젯을 생성합니다.
  const CameraButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ServiceColors.background,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 3,
              offset: const Offset(3, 3), // changes position of shadow
            ),
          ],
        ),
        margin: const EdgeInsets.all(10),
        width: 60,
        height: 60,
        child: SvgPicture.asset(
          ServiceAssets.photoIcon,
          fit: BoxFit.scaleDown,
          width: 30,
        ),
      ),
    );
  }
}
