import 'package:flutter/material.dart';
import 'package:geoquiz/models/question.dart';

class GameMainQuestionInfo extends StatelessWidget {
  final Question questionInfo;
  const GameMainQuestionInfo({Key? key, required this.questionInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Text(questionInfo.categoryName),
        const SizedBox(
          height: 24,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: Container(
              padding: const EdgeInsets.all(8), // Border width
              decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(5)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(120), // Image radius
                  child: Image.network(questionInfo.pictureUrl, fit: BoxFit.cover),
                ),
              ),
            )
        ),

      ],
    );
  }
}