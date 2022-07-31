import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoquiz/game/bloc/game_bloc.dart';
import 'package:geoquiz/generated/l10n.dart';
import 'package:geoquiz/main_widgets/fire_rotation_widget.dart';
import 'package:geoquiz/game/pages/complete_page.dart';
import 'package:geoquiz/services/airtable_service.dart';
import 'package:geoquiz/theme.dart';

class GameGoNextButton extends StatelessWidget {
  final String questionInfo;
  final int questionNumber;
  const GameGoNextButton({Key? key, required this.questionNumber, required this.questionInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameBloc(
        RepositoryProvider.of<AirtableService>(context),
      )..add(NextQuestionEvent(questionInfo,questionNumber)),
      child:
      BlocBuilder<GameBloc,GameState>(
        builder: (context, state) {
          if (state is NextQuestionState) {
            return TextButton(
              style: AppButtonStyle.GoNexttButton,
              onPressed: () {

             return   context.read<GameBloc>().add(LoadingApiEvent(questionInfo,questionInfo,state.questionNumber));
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