part of 'qion_bloc.dart';

abstract class QuestionState extends Equatable {
  const QuestionState();
}

class QuestionInitial extends QuestionState {
  @override
  List<Object> get props => [];
}

class QuestionLoadingState extends QuestionState {
  @override
  List<Object> get props => [];
}


class QuestionLoadedState extends QuestionState {

  final Question question;
  final List<Answer> answers;

  QuestionLoadedState(this.question, this.answers);

  @override
  List<Object> get props => [question,answers];
}