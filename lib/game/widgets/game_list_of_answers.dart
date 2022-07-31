import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoquiz/game/bloc/game_bloc.dart';
import 'package:geoquiz/models/answer.dart';
import 'package:geoquiz/models/question.dart';
import 'package:geoquiz/theme.dart';

class GameListOfAnswers extends StatelessWidget {
  final int currentQuestionNumber;
  final Question questionInfo;
  final List <Answer> answers;
  const GameListOfAnswers({Key? key, required this.answers, required this.questionInfo, required this.currentQuestionNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: answers.length,
          itemBuilder: (BuildContext context, int index) {
            return ElevatedButton(
              style: AppButtonStyle.defaultButton,
              child:Text(answers[index].description, style: const TextStyle(fontSize: 22)),
              onPressed: (){

                if (answers[index].right){
                  return context.read<GameBloc>().add(RightButtonClicked(questionInfo: questionInfo, answers:answers, currentNumber: currentQuestionNumber,));
                }
                else {
                  return context.read<GameBloc>().add(WrongButtonClicked(answers: answers, checkIndex: index, questionInfo: questionInfo));
                  }

              },
            );
          }
      );
  }
}