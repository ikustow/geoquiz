import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoquiz/game/bloc/game_bloc.dart';
import 'package:geoquiz/game/widgets/game_list_of_answers.dart';
import 'package:geoquiz/game/widgets/game_question_main_info.dart';
import 'package:geoquiz/game/widgets/game_right_list_of_answers.dart';
import 'package:geoquiz/game/widgets/game_row_of_fail.dart';
import 'package:geoquiz/game/widgets/game_row_of_fire.dart';
import 'package:geoquiz/game/widgets/game_wrong_answers_list.dart';
import 'package:geoquiz/generated/l10n.dart';
import 'package:geoquiz/main_widgets/bottom_navigation_bar.dart';
import 'package:geoquiz/services/airtable_service.dart';
import 'package:geoquiz/theme.dart';

import 'complete_page.dart';
import '../widgets/game_restart_button.dart';

class GamePage extends StatelessWidget {
  final String id;
  final String category;
  final int questionNumber;

  const GamePage({Key? key,
    required this.id,
    required this.category,
    required this.questionNumber})
      : super(key: key);

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GameBloc(
        RepositoryProvider.of<AirtableService>(context),
    )..add(LoadingApiEvent(id,category,questionNumber)),
      child: GamePageView(
        questionNumber: questionNumber,
        id: id,
        category: category,
      ),
    );
  }
}

class GamePageView extends StatelessWidget {
  final String id;
  final String category;
  final int questionNumber;

  const GamePageView({Key? key,
    required this.id,
    required this.category,
    required this.questionNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentNumber = questionNumber;
    final appbarTitle = S.of(context).number_title;
    return Scaffold(
      appBar: AppBar(
        title: Text("$appbarTitle $questionNumber"),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(index: 0),
      body: BlocBuilder<GameBloc, GameState>(

          builder: (context, state) {
        if (state is GameLoadingApiEventState) {

          return Column(
            children: [
              GameMainQuestionInfo(questionInfo: state.question,),
              GameListOfAnswers(answers: state.answers, questionInfo: state.question,currentQuestionNumber: currentNumber),
            ],
          );
        }
        if (state is GameRight) {
          return Column(
            children: [
              GameMainQuestionInfo(questionInfo: state.question,),
              GameRightListOfAnswers(answers: state.answers),
              GameRowOfFire(),
              SizedBox(height: 24,),
              if (state.isFinal != true) ...[
                TextButton(
                  style: AppButtonStyle.GoNexttButton,
                  onPressed: () {
                    currentNumber = state.newNumber;
                    return   context.read<GameBloc>().add(LoadingApiEvent(id, category , currentNumber));
                  }, child: Text(S.of(context).go_next_title,),
                )
              ] else ...[
                TextButton(
                  style: AppButtonStyle.GoNexttButton,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  CompletePage(category: state.question.categoryID,)),
                    );
                  }, child: Text( S.of(context).final_title,),
                )
              ],

            //  GameGoNextButton(questionNumber: currentNumber, questionInfo: state.question.categoryID,),
            ],
          );
        }
        if (state is GameWrong) {

          return Center(
            child: Column(
              children: [
             GameMainQuestionInfo(questionInfo: state.questionInfo,),
             GameWrongListOfAnswers(answers: state.answers, checkIndex: state.checkIndex,),
             GameRowOfFail(),
             SizedBox(height: 24,),
                TextButton(
                  style: AppButtonStyle.GoNexttButton,
                  onPressed: () {
                    return   context.read<GameBloc>().add(LoadingApiEvent(id, category , currentNumber));
                  }, child: Text(S.of(context).restart_title,),
                )
              ],
            ),
          );
        }
        return Center(
          child: Container(
            child: CircularProgressIndicator(),
          ),
        );
      }),
    );
  }
}
