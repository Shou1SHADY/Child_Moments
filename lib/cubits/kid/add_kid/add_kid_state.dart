part of 'add_kid_cubit.dart';

@immutable
abstract class AddKidState {}

class AddKidInitial extends AddKidState {}

////////////////////////////////////////////
class SuccessfulDataUsers extends AddKidState {}

class ErrorDataUsers extends AddKidState {
  String error;
  ErrorDataUsers({required this.error});
}

////////////////////////////////////////////

