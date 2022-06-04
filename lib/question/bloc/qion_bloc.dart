
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geoquiz/models/answer.dart';
import 'package:geoquiz/models/question.dart';
import 'package:geoquiz/services/airtable_service.dart';

import '../../services/connectivity_service.dart';

part 'qion_event.dart';
part 'qion_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final  AirtableService _airtableService;

  QuestionBloc(this._airtableService) : super(QuestionInitial()) {
    on<QuestionEvent>((event, emit) {
      emit(QuestionLoadingState());
    });


    on<LoadQuestionApiEvent>((event, emit)  async  {
        final questionInfo = await _airtableService.getAirtableQuestionByCategory(event.category, event.id);
        final answers = await _airtableService.getAirtableAnswersByQuestion(questionInfo);
        emit(QuestionLoadedState(questionInfo,answers));
    });
  }
}
