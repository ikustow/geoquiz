import 'package:flutter/material.dart';
import 'package:geoquiz/models/answer.dart';
import 'package:geoquiz/theme.dart';

class WrongListOfAnswers extends StatelessWidget {
  final List <Answer> answers;
  final int checkIndex;
  const WrongListOfAnswers({Key? key, required this.answers, required this.checkIndex,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: answers.length,
          itemBuilder: (BuildContext context, int index) {

            return ElevatedButton(

              style: (index == checkIndex)
                  ? AppButtonStyle.WrongButton
                  : AppButtonStyle.DefaultButton,
              child:Text(answers[index].description, style: TextStyle(fontSize: 22)),
              onPressed: (){},
            );
          }
      );
  }
}