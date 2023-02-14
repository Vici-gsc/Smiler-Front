import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smiler/presentation/component/organism/camera_widget.dart';
import 'package:smiler/presentation/component/template/game_template.dart';
import 'package:smiler/presentation/imitating/imitating_view_model.dart';

import '../component/molecule/emotion_image.dart';

class ImitatingScreen extends StatelessWidget {
  const ImitatingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ImitatingViewModel>();

    return GameTemplate(
      headerString: "표정을 따라해 보아요!",
      onSkip: () {},
      currentQuestionCount: 0,
      correctAnswerCount: 0,
      upperChild: const EmotionImage(
        url: "https://dummyimage.com/600x400/000/fff",
        emotionName: "기쁨",
      ),
      lowerChild: CameraWidget(
        camera: viewModel.camera!,
        onCaptured: (p) {},
      ),
    );
  }
}
