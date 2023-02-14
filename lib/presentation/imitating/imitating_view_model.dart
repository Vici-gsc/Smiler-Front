import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class ImitatingViewModel with ChangeNotifier {
  final CameraDescription? camera;

  ImitatingViewModel(this.camera);
}
