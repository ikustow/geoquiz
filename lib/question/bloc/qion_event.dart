part of 'qion_bloc.dart';

abstract class QuestionEvent extends Equatable {
  const QuestionEvent();
}


class LoadQuestionApiEvent extends QuestionEvent {

  final id;
  final category;
  final questionNumber;

  LoadQuestionApiEvent(this.id, this.category, this.questionNumber);


  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class checkAnswerEvent extends QuestionEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NextQuestionEvent extends QuestionEvent {

  final questionInfo;
  final questionNumber;

  NextQuestionEvent(this.questionInfo, this.questionNumber);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}