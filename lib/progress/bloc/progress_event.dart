part of 'progress_bloc.dart';

abstract class ProgressEvent extends Equatable {
  const ProgressEvent();
}

class LoadApiEvent extends ProgressEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
