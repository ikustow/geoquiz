import 'package:flutter/material.dart';
import 'package:geoquiz/question/widgets.dart';

import '../models/answer.dart';
import '../models/question.dart';
import '../theme.dart';

class RightAnswerPage extends StatelessWidget {
  final Question questionInfo;
  final List <Answer> answers;
  final int currentQuestionNumber;
  const RightAnswerPage({Key? key, required this.questionInfo, required this.answers, required this.currentQuestionNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Right'),),
      body: Column(
        children: [
          MainQuestionInfo(questionInfo: questionInfo,),
          RightListOfAnswers(answers: answers,),
          GoNextButton(questionNumber: currentQuestionNumber, questionInfo: questionInfo.categoryName,)
        ],
      ),
    );
  }
}

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