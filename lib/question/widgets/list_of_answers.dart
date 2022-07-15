import 'package:flutter/material.dart';
import 'package:geoquiz/models/answer.dart';
import 'package:geoquiz/models/question.dart';
import 'package:geoquiz/question/pages/right_answer_page.dart';
import 'package:geoquiz/theme.dart';

import '../pages/wrong_answer_page.dart';

class ListOfAnswers extends StatelessWidget {
  final int currentQuestionNumber;
  final Question questionInfo;
  final List <Answer> answers;
  const ListOfAnswers({Key? key, required this.answers, required this.questionInfo, required this.currentQuestionNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: answers.length,
          itemBuilder: (BuildContext context, int index) {
            return ElevatedButton(
              style: AppButtonStyle.DefaultButton,
              child:Text(answers[index].description, style: TextStyle(fontSize: 22)),
              onPressed: (){
                if (answers[index].right){
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>RightAnswerPage(questionInfo: questionInfo, answers: answers, currentQuestionNumber:currentQuestionNumber ,),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                }
                else {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>WrongAnswerPage(questionInfo: questionInfo, answers: answers, currentQuestionNumber:currentQuestionNumber, checkIndex: index ,),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                }
              },
            );
          }
      );
  }
}

//