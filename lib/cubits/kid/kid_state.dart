part of 'kid_cubit.dart';

@immutable
abstract class KidState {}

class KidInitial extends KidState {}

////////////////////////////////////////////
class SuccessfulDataUsers extends KidState {}

class ErrorDataUsers extends KidState {
  String error;
  ErrorDataUsers({required this.error});
}

////////////////////////////////////////////

