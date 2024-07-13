import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'dark_state.dart';

class DarkCubit extends Cubit<DarkState> {
  DarkCubit() : super(DarkInitial());

  static DarkCubit get(context) => BlocProvider.of(context);

  bool status = false;
  int counter = 0;

  void getCounter(int counter) {
    if (this.counter != counter) {
      this.counter == counter;
      emit(CounterIncrease());
    } else {
      this.counter = counter;
      emit(CounterStable());
    }
  }

  void getTheme() {
    if (status == false) {
      emit(Light());
    } else {
      emit(Dark());
    }
  }
}
