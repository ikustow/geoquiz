import 'package:flutter/material.dart';

import 'package:geoquiz/theme.dart';

import '../../generated/l10n.dart';
import '../pages/question_page.dart';

class RestartButton extends StatelessWidget {
  final String questionInfo;
  final int questionNumber;
  const RestartButton({Key? key, required this.questionNumber, required this.questionInfo, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   TextButton(
      style: AppButtonStyle.GoNexttButton,
      onPressed: () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>QuestionPage(category: questionInfo, id: questionInfo, questionNumber:questionNumber,),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      }, child: Text(S.of(context).restart_title,),
    );
  }
}