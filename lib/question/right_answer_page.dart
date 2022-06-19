import 'package:flutter/material.dart';
import 'package:geoquiz/question/widgets.dart';

import '../models/answer.dart';
import '../models/question.dart';

class RightAnswerPage extends StatelessWidget {
  final Question questionInfo;
  final List <Answer> answers;
  const RightAnswerPage({Key? key, required this.questionInfo, required this.answers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Right'),),
      body: Column(
        children: [
          MainQuestionInfo(questionInfo: questionInfo,),
          RightListOfAnswers(answers: answers,),
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
              child:Text(answers[index].description, style: TextStyle(fontSize: 22)),
              onPressed: (){

              },
            );
          }
      );
  }
}