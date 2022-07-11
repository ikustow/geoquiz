import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geoquiz/models/answer.dart';
import 'package:geoquiz/models/question.dart';
import 'package:geoquiz/services/airtable_service.dart';

part 'qion_event.dart';
part 'qion_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final  AirtableService _airtableService;

  QuestionBloc(this._airtableService) : super(QuestionInitial()) {
    on<QuestionEvent>((event, emit) {
      emit(QuestionLoadingState());
    });


    on<LoadQuestionApiEvent>((event, emit)  async  {

      final questionInfo = await _airtableService.getAirtableQuestionByCategory(event.id, event.id, event.questionNumber);
      final answers = await _airtableService.getAirtableAnswersByQuestion(questionInfo, event.questionNumber);
        emit(QuestionLoadedState(questionInfo,answers));
    });

    on<checkAnswerEvent>((event, emit)  async  {

      emit(QuestionCheckState());
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
