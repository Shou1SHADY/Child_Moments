part of 'addteacher_cubit.dart';

@immutable
abstract class AddTeacherState {}

class AddTeacherInitial extends AddTeacherState {}

////////////////////////////////////////////
class SuccessfulDataUsers extends AddTeacherState {}

class ErrorDataUsers extends AddTeacherState {
  String error;
  ErrorDataUsers({required this.error});
}


////////////////////////////////////////////