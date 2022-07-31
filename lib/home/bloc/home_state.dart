part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}


class HomeLoadedState extends HomeState {
  final List<Category> categories;

  const HomeLoadedState(this.categories);
  @override
  // TODO: implement props
  List<Object?> get props => [categories];
}

class HomeNoInternetState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}