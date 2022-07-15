part of 'progress_bloc.dart';

abstract class ProgressState extends Equatable {
  const ProgressState();
}

class ProgressInitial extends ProgressState {
  @override
  List<Object> get props => [];
}


class ProgressLoadingState extends ProgressState {
  @override
  List<Object> get props => [];
}

class ProgressLoadedState extends ProgressState {
  final CurrentProgress progress;

  ProgressLoadedState(this.progress);
  @override
  // TODO: implement props
  List<Object?> get props => [progress];
}