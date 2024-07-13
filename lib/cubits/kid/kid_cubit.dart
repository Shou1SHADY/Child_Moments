import 'package:child_moments/core/Network/Constant.dart';
import 'package:child_moments/core/Network/Dio.dart';
import 'package:child_moments/models/get_all_teacher.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/teacher.dart';

part 'kid_state.dart';

class KidCubit extends Cubit<KidState> {
  KidCubit() : super(KidInitial());

  static KidCubit get(context) => BlocProvider.of(context);

  //AllTeachers? allteachers;
  // List<Teacher> teachers = [];
  void getTeachers(String id) {
    DioHelper.postData(url: ALLTEACHERS, data: {}).then(((value) {
      if (value.statusCode == 200) {
        //     allteachers = AllTeachers.fromJson(value.data);

        emit(SuccessfulDataUsers());
      } else {
        emit(ErrorDataUsers(error: "error"));
      }
    })).catchError((onError) {
      //emit(ErrorDataUsers(error: onError.toString()));
    });
  }
}
