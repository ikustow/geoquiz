import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geoquiz/models/answer.dart';
import 'package:geoquiz/models/question.dart';
import 'package:geoquiz/services/airtable_service.dart';

part 'game_event.dart';

part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final AirtableService _airtableService;

  GameBloc(this._airtableService)
      : super(
      GameInitial(),
        ) {


    on<GameEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadingApiEvent>((event, emit) async {
      final questionInfo = await _airtableService.getAirtableQuestionByCategory(
          event.id, event.id, event.questionNumber);
      final answers = await _airtableService.getAirtableAnswersByQuestion(
          questionInfo, event.questionNumber);

      emit(GameLoadingApiEventState(question: questionInfo, answers: answers));
    });

    on<RightButtonClicked>((event, emit) async {
      // TODO: implement event handler

      final categoryData = await _airtableService.getAirtableCategoriesDio(event.questionInfo.categoryID);

      if (categoryData == event.currentNumber){
        emit(GameRight(question: event.questionInfo, answers: event.answers, isFinal: true, newNumber: event.currentNumber));
      }
      else {
        final questionNumber = await _airtableService.updateUserStatus(event.questionInfo.categoryID, event.currentNumber);
        emit(GameRight(question: event.questionInfo, answers: event.answers, isFinal: false, newNumber: questionNumber));
      }
    });

    on<WrongButtonClicked>((event, emit) {
      emit(GameWrong(checkIndex: event.checkIndex, answers: event.answers, questionInfo: event.questionInfo));
      // TODO: implement event handler
    });

    on<ResetButtonClicked>((event, emit) {
      // TODO: implement event handler
      emit(GameInitial());
    });

    on<NextQuestionEvent>((event, emit)  async  {

      final categoryData = await _airtableService.getAirtableCategoriesDio(event.questionInfo);

      if (categoryData == event.questionNumber){
        emit(CompleteQuizState(event.questionInfo));
      }
      else {
        final questionNumber = await _airtableService.updateUserStatus(event.questionInfo, event.questionNumber);
        emit(NextQuestionState(questionNumber));
      }
    });


  }
}
