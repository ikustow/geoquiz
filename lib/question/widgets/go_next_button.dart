import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoquiz/services/airtable_service.dart';

import '../../generated/l10n.dart';
import '../../main_widgets/error_widget.dart';
import '../../main_widgets/fire_rotation_widget.dart';
import '../../theme.dart';
import '../bloc/qion_bloc.dart';
import '../pages/complete_page.dart';
import '../pages/question_page.dart';

class GoNextButton extends StatelessWidget {
  final String questionInfo;
  final int questionNumber;
  const GoNextButton({Key? key, required this.questionNumber, required this.questionInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionBloc(
        RepositoryProvider.of<AirtableService>(context),
      )..add(NextQuestionEvent(questionInfo,questionNumber)),
      child:
      BlocBuilder<QuestionBloc,QuestionState>(
        builder: (context, state) {
          if (state is NextQuestionState) {
            return TextButton(
              style: AppButtonStyle.GoNexttButton,
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  QuestionPage(category: questionInfo, id: questionInfo, questionNumber:state.questionNumber,)),
              );
            }, child: Text(S.of(context).go_next_title,),
            );
          }

          if (state is CompleteQuizState) {
            return TextButton(
              style: AppButtonStyle.GoNexttButton,
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  CompletePage(category: questionInfo,)),
              );
            }, child: Text( S.of(context).final_title,),
            );
          }

          return Container(
            child:  FireRotationWidget(),
          );
        },
      ),
    );
  }
}