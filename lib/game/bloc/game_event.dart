part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();
}

class RightButtonClicked extends GameEvent {

  final int currentNumber;
  final questionInfo;
  final answers;

  const RightButtonClicked( {required this.currentNumber,required this.questionInfo, required this.answers});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class WrongButtonClicked extends GameEvent {

  final questionInfo;
  final answers;
  final checkIndex;

  const WrongButtonClicked({required this.questionInfo, required this.answers, required this.checkIndex});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ResetButtonClicked extends GameEvent {
  const ResetButtonClicked();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingApiEvent extends GameEvent {

  const LoadingApiEvent(this.id, this.category, this.questionNumber);

  final id;
  final category;
  final questionNumber;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class NextQuestionEvent extends GameEvent {

  final questionInfo;
  final questionNumber;

  NextQuestionEvent(this.questionInfo, this.questionNumber);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}