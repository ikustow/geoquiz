import 'package:flutter/material.dart';
import 'package:geoquiz/main_widgets/fail_rotation_widget.dart';

class GameRowOfFail extends StatelessWidget {
  const GameRowOfFail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 16,),
        FailRotationWidget(),
        SizedBox(width: 8,),
        FailRotationWidget(),
        SizedBox(width: 8,),
        FailRotationWidget(),
      ],
    );
  }
}