import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smiler/presentation/component/organism/camera_widget.dart';
import 'package:smiler/presentation/expression/expression_view_model.dart';

import '../component/template/game_template.dart';

class ExpressionScreen extends StatelessWidget {
  const ExpressionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ExpressionViewModel>();

    return GameTemplate(
      headerString: "표정을 지어 보아요!",
      onSkip: () {},
      currentQuestionCount: 0,
      correctAnswerCount: 0,
      isLoading: false,
      upperChild: Center(
        child: Text(
          "기쁨",
          style:
              Theme.of(context).textTheme.titleMedium!.apply(fontSizeDelta: 20),
        ),
      ),
      lowerChild: CameraWidget(
        camera: viewModel.camera!,
        onCaptured: (p) {},
      ),
    );
  }
}
