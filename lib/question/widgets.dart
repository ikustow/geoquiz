import 'package:flutter/material.dart';
import 'package:geoquiz/models/question.dart';

class MainQuestionInfo extends StatelessWidget {
  final Question questionInfo;
  const MainQuestionInfo({Key? key, required this.questionInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("What the city?"),
        SizedBox(
          height: 10,
        ),
        Image.network(questionInfo.pictureUrl)
      ],
    );
  }
}



class GoNextButton extends StatelessWidget {
  final int questionNumber;
  const GoNextButton({Key? key, required this.questionNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(onPressed:(){}, child: Text("Go next!"))
      ],
    );
  }
}

