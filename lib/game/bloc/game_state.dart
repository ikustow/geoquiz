part of 'game_bloc.dart';

abstract class GameState  {
  const GameState();
}

class GameInitial extends GameState {


  GameInitial();

  @override
  List<Object> get props =>  [];
}

class GameLoadingApiEventState extends GameState {
  final Question question;
  final List<Answer> answers;

  GameLoadingApiEventState({required this.question, required this.answers});

}

class GameRight extends GameState {

  final bool isFinal;
  final int newNumber;
  final Question question;
  final List<Answer> answers;

  GameRight({required this.isFinal,required this.question, required this.answers,required this.newNumber,});

  @override
  List<Object> get props => [];
}

class GameWrong extends GameState {
  final answers;
  final checkIndex;
  final questionInfo;

  GameWrong({required this.questionInfo,required this.answers,required this.checkIndex});
  @override
  List<Object> get props => [];
}


class NextQuestionState extends GameState {
  final questionNumber;

  NextQuestionState(this.questionNumber);
  @override
  List<Object> get props => [];
}

class CompleteQuizState extends GameState {
  final questionCategory;

  CompleteQuizState(this.questionCategory);

  @override
  List<Object> get props => [];
}


