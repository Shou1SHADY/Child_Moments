part of 'dark_cubit.dart';

@immutable
abstract class DarkState {}

class DarkInitial extends DarkState {}

////////////////////////////////////////////
class Dark extends DarkState {}

class Light extends DarkState {}

////////////////////////////////////////////
///
class CounterIncrease extends DarkState {}

class CounterStable extends DarkState {}
/////////////////////////////////////