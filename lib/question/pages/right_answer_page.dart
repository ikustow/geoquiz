import 'package:flutter/material.dart';
import 'package:geoquiz/question/widgets/row_of_fire.dart';
import '../../generated/l10n.dart';
import '../../main_widgets/bottom_navigation_bar.dart';
import '../../models/answer.dart';
import '../../models/question.dart';
import '../../theme.dart';
import '../widgets/go_next_button.dart';
import '../widgets/main_question_info.dart';
import '../widgets/right_list_of_answers.dart';

class RightAnswerPage extends StatelessWidget {
  final Question questionInfo;
  final List <Answer> answers;
  final int currentQuestionNumber;
  const RightAnswerPage({Key? key, required this.questionInfo, required this.answers, required this.currentQuestionNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).right_app_bar_title,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MainQuestionInfo(questionInfo: questionInfo,),
          RightListOfAnswers(answers: answers,),
          RowOfFire(),
          SizedBox(height: 24,),
          GoNextButton(questionNumber: currentQuestionNumber, questionInfo: questionInfo.categoryID,)
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(index: 0),
    );
  }
}

