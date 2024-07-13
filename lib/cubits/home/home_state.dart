part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

////////////////////////////////////////////
class LoadingDataUsers extends HomeState {}

class SuccessfulDataUsers extends HomeState {}

class ErrorDataUsers extends HomeState {
  String error;
  ErrorDataUsers({required this.error});
}

////////////////////////////////////////////