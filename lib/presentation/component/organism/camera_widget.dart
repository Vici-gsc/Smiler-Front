import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smiler/presentation/component/molecule/camera_button.dart';

import '../../../ui/service_colors.dart';
import '../molecule/alert_flush_bar.dart';
import '../molecule/modal_button.dart';

/// 카메라 미리 보기와 촬영 버튼을 보여주는 위젯입니다.
class CameraWidget extends StatefulWidget {
  /// 사용할 카메라입니다.
  final CameraDescription camera;

  /// 촬영이 완료되면 호출되는 콜백입니다. 촬영된 이미지의 경로가 [imagePath]로 전달됩니다.
  final Function(String imagePath) onCaptured;

  /// 카메라 미리 보기와 촬영 버튼을 보여주는 위젯을 생성합니다.
  ///
  /// 미리보기와 카메라의 이미지 데이터의 비율이 다를 경우 center-crop합니다.
  /// 다만 저장되는 이미지는 원본 비율을 유지합니다.
  const CameraWidget({
    Key? key,
    required this.camera,
    required this.onCaptured,
  }) : super(key: key);

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  @override
  void dispose() {
    _disposeCamera();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasError) {
            return Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRect(
                  child: SizedBox(
                    width: double.infinity,
                    child: FittedBox(
                      alignment: Alignment.center,
                      fit: BoxFit.fitWidth,
                      child: SizedBox(
                        width: 100,
                        height: 100 * _controller.value.aspectRatio,
                        child: CameraPreview(_controller),
                      ),
                    ),
                  ),
                ),
                CameraButton(
                  onTap: () async {
                    try {
                      await _initializeControllerFuture;
                      final path = await _controller.takePicture();
                      widget.onCaptured(path.path);
                    } catch (e) {
                      AlertFlushBar("촬영에 실패하였습니다. 다시 시도해주세요.").show(context);
                    }
                  },
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return _CameraPermissionWidget(
              onGranted: () {
                setState(() {
                  _disposeCamera();
                  _initCamera();
                });
              },
              onDenied: () {
                AlertFlushBar("서비스 이용을 위해 카메라 권한을 허용해주세요.").show(context);
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  void _initCamera() {
    _controller = CameraController(
      widget.camera, // 사용할 카메라
      ResolutionPreset.high, // 비디오 화질
      enableAudio: false, // 오디오 사용 여부
    );
    _initializeControllerFuture = _controller.initialize();
  }

  void _disposeCamera() {
    _controller.dispose();
  }
}

/// 카메라 권한이 없을 경우 보여주는 위젯입니다.
class _CameraPermissionWidget extends StatelessWidget {
  /// 권한 설정을 완료하면 호출되는 콜백입니다.
  final Function()? onGranted;

  /// 권한 설정을 거부하면 호출되는 콜백입니다.
  final Function()? onDenied;

  /// 카메라 권한이 없을 경우 보여주는 위젯을 생성합니다.
  const _CameraPermissionWidget({
    Key? key,
    this.onGranted,
    this.onDenied,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "카메라를 실행하려면 권한 설정이 필요합니다.",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 150,
          child: ModalButton(
            text: "권한 설정하기",
            color: ServiceColors.primary,
            onTap: () async {
              final permissionStatus = await Permission.camera.request();
              if (permissionStatus.isGranted) {
                // 권한이 허용되었을 경우
                onGranted?.call();
              } else if (permissionStatus.isPermanentlyDenied) {
                // 권한이 영구적으로 거부되었을 경우
                openAppSettings();
              } else {
                // 권한이 거부되었을 경우
                onDenied?.call();
              }
            },
          ),
        ),
      ],
    );
  }
}
