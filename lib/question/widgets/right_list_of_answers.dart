import 'package:flutter/material.dart';
import 'package:geoquiz/models/answer.dart';

import '../../theme.dart';

class RightListOfAnswers extends StatelessWidget {
  final List <Answer> answers;
  const RightListOfAnswers({Key? key, required this.answers,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: answers.length,
          itemBuilder: (BuildContext context, int index) {
            return ElevatedButton(
              style: (answers[index].right == true)
                  ? AppButtonStyle.RightButton
                  : AppButtonStyle.DefaultButton,
              child:Text(answers[index].description, style: TextStyle(fontSize: 22)),
              onPressed: (){},
            );
          }
      );
  }
}