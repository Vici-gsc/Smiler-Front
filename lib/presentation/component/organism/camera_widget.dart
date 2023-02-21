import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smiler/presentation/component/molecule/camera_button.dart';

import '../../../ui/service_colors.dart';
import '../molecule/modal_button.dart';

class CameraWidget extends StatefulWidget {
  final CameraDescription camera;
  final Function(String imagePath) onCaptured;

  const CameraWidget({Key? key, required this.camera, required this.onCaptured})
      : super(key: key);

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
                      print(e);
                    }
                  },
                ),
              ],
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return _CameraPermissionWidget(onGranted: () {
              setState(() {
                _disposeCamera();
                _initCamera();
              });
            });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  void _initCamera() {
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
      enableAudio: false,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  void _disposeCamera() {
    _controller.dispose();
  }
}

class _CameraPermissionWidget extends StatelessWidget {
  final Function()? onGranted;
  final Function()? onDenied;

  const _CameraPermissionWidget({Key? key, this.onGranted, this.onDenied})
      : super(key: key);

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
                onGranted?.call();
              } else if (permissionStatus.isPermanentlyDenied) {
                openAppSettings();
              } else {
                onDenied?.call();
              }
            },
          ),
        ),
      ],
    );
  }
}
