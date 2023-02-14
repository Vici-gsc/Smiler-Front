import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class ExpressionViewModel with ChangeNotifier {
  final CameraDescription? camera;

  ExpressionViewModel(this.camera);
}
