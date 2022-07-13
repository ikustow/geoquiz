
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class AnimatedWelcomeText extends StatefulWidget {
  const AnimatedWelcomeText({Key? key}) : super(key: key);

  @override
  State<AnimatedWelcomeText> createState() => _AnimatedWelcomeTextState();
}

class _AnimatedWelcomeTextState extends State<AnimatedWelcomeText> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: _rotate(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rotate(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(width: 10.0, height: 100.0),
        const SizedBox(width: 10.0, height: 100.0),
        DefaultTextStyle(
          style: const TextStyle(
            fontSize: 35.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "railway",
          ),
          child: AnimatedTextKit(
              totalRepeatCount: 1,
              repeatForever: false,
              isRepeatingAnimation: true,
              animatedTexts: [
                RotateAnimatedText(S.of(context).welcome_animate_title_1,),
                RotateAnimatedText(S.of(context).welcome_animate_title_2,),
                RotateAnimatedText(S.of(context).welcome_animate_title_3,),
                RotateAnimatedText(S.of(context).welcome_animate_title_4,),
              ]),
        ),
      ],
    );
  }

}