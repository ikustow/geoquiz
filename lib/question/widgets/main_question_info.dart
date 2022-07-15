import 'package:flutter/material.dart';

import '../../models/question.dart';

class MainQuestionInfo extends StatelessWidget {
  final Question questionInfo;
  const MainQuestionInfo({Key? key, required this.questionInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
       // Text(questionInfo.categoryName),
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          child: Container(
            padding: EdgeInsets.all(8), // Border width
            decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(5)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: SizedBox.fromSize(
                size: Size.fromRadius(120), // Image radius
                child: Image.network(questionInfo.pictureUrl, fit: BoxFit.cover),
              ),
            ),
          )
        ),

      ],
    );
  }
}