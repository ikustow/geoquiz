
import 'package:flutter/material.dart';
import 'package:geoquiz/models/answer.dart';
import 'package:geoquiz/question/widgets/wrong_list_of_answers.dart';

import '../../generated/l10n.dart';
import '../../main_widgets/bottom_navigation_bar.dart';
import '../../models/question.dart';
import '../widgets/main_question_info.dart';
import '../widgets/restart_button_widget.dart';

class WrongAnswerPage extends StatelessWidget {
  final int currentQuestionNumber;
  final Question questionInfo;
  final List <Answer> answers;
  final int checkIndex;
  const WrongAnswerPage({Key? key, required this.checkIndex, required this.answers, required this.currentQuestionNumber, required this.questionInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).wrong_app_bar_title,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MainQuestionInfo(questionInfo: questionInfo,),
          WrongListOfAnswers(answers: answers, checkIndex: checkIndex),
          const SizedBox(height: 8,),
         // RowOfFail(),
          const SizedBox(height: 32,),
          RestartButton(questionNumber: currentQuestionNumber, questionInfo: questionInfo.categoryID,),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(index: 0),
    );
  }
}
