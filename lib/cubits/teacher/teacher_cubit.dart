import 'package:child_moments/core/Network/Constant.dart';
import 'package:child_moments/core/Network/Dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/teacher.dart';

part 'teacher_state.dart';

class TeacherCubit extends Cubit<TeacherState> {
  TeacherCubit() : super(TeacherInitial());

  static TeacherCubit get(context) => BlocProvider.of(context);

  void getAsce(bool Asc) {
    if (Asc == true) {
      emit(Mychoice());
    } else {
      emit(NotmyChoice());
    }
  }

  void getChoice(bool myChoice) {
    if (myChoice == true) {
      emit(Mychoice());
    } else {
      emit(NotmyChoice());
    }
  }
}
