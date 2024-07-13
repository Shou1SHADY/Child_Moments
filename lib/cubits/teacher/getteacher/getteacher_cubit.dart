import 'package:child_moments/core/Network/Constant.dart';
import 'package:child_moments/core/Network/Dio.dart';
import 'package:child_moments/models/get_all_teacher.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/teacher.dart';

part 'getteacher_state.dart';

class GetTeacherCubit extends Cubit<GetTeacherState> {
  GetTeacherCubit() : super(GetTeacherInitial());

  static GetTeacherCubit get(context) => BlocProvider.of(context);

  AllTeachers? allteachers;
  // List<Teacher> teachers = [];
  void getTeachers(String id) {
    emit(LoadingDataUsers());
    DioHelper.postData(
            url: ALLTEACHERS,
            data: {"school": id, "role": "TEACHER", "status": "ACTIVE"})
        .then(((value) {
      if (value.statusCode == 200) {
        allteachers = AllTeachers.fromJson(value.data);
        // for (int i =0 )
        //  var response = value.data;
        //  int i = AllTeachers.fromJson(value.data).data!.length;
        // for (int i = 0;
        //     i < AllTeachers.fromJson(value.data).data!.length;
        //     i++) {
        //   teachers.add(AllTeachers.fromJson(value.data).data![i]);
        // }
        // for (var element in value.data) {
        //   teachers.add(AllTeachers.fromJson(value.data).data![element]);
        // }

        emit(SuccessfulDataUsers());
      } else {
        emit(ErrorDataUsers(error: "error"));
      }
    })).catchError((onError) {
      //emit(ErrorDataUsers(error: onError.toString()));
    });
  }
}
