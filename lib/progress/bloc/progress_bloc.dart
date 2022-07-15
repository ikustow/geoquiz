import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geoquiz/models/current_progress.dart';
import 'package:geoquiz/services/airtable_service.dart';

part 'progress_event.dart';
part 'progress_state.dart';

class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  final AirtableService _airtableService;

  ProgressBloc(this._airtableService) : super(ProgressInitial()) {
    on<ProgressEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadApiEvent>((event, emit) async {
      emit(ProgressLoadingState());
      final progressValue = await _airtableService.getAirtableProgressByUser();
      emit(ProgressLoadedState(progressValue));
    });


  }


}
