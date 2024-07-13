part of 'rooms_cubit.dart';

@immutable
abstract class RoomState {}

class RoomInitial extends RoomState {}

////////////////////////////////////////////
class LoadingDataUsers extends RoomState {}

class SuccessfulDataUsers extends RoomState {}

class ErrorDataUsers extends RoomState {
  String error;
  ErrorDataUsers({required this.error});
}

////////////////////////////////////////////