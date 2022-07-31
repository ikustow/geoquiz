import 'package:flutter/material.dart';
import 'package:geoquiz/main_widgets/fire_rotation_widget.dart';

class GameRowOfFire extends StatelessWidget {
  const GameRowOfFire({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 16,),
        FireRotationWidget(),
        SizedBox(width: 8,),
        FireRotationWidget(),
        SizedBox(width: 8,),
        FireRotationWidget(),
      ],
    );
  }
}
