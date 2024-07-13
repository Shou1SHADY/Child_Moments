part of 'getteacher_cubit.dart';

@immutable
abstract class GetTeacherState {}

class GetTeacherInitial extends GetTeacherState {}

////////////////////////////////////
class LoadingDataUsers extends GetTeacherState {}

class SuccessfulDataUsers extends GetTeacherState {}

class ErrorDataUsers extends GetTeacherState {
  String error;
  ErrorDataUsers({required this.error});
  /////////////////////////////////////
}
