part of 'qion_bloc.dart';

abstract class QuestionEvent extends Equatable {
  const QuestionEvent();
}


class LoadQuestionApiEvent extends QuestionEvent {

  final id;
  final category;

  LoadQuestionApiEvent(this.id, this.category);


  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class checkAnswerEvent extends QuestionEvent {


  @override
  // TODO: implement props
  List<Object?> get props => [];
}