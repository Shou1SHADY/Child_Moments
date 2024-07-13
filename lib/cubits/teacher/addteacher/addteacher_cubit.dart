import 'package:child_moments/core/Local/shared_pref.dart';
import 'package:child_moments/core/Network/Constant.dart';
import 'package:child_moments/models/school.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/Network/Dio.dart';
import '../../../models/teacher.dart';

part 'addteacher_state.dart';

class AddTeacherCubit extends Cubit<AddTeacherState> {
  bool isExisting = false;
  AddTeacherCubit() : super(AddTeacherInitial());
  static List<String?> emails = [];
  static AddTeacherCubit get(context) => BlocProvider.of(context);

  Teacher teacher = Teacher();

  void addTeacher(
      String id,
      String country,
      TextEditingController CityC,
      TextEditingController address,
      TextEditingController email,
      TextEditingController first,
      TextEditingController last,
      TextEditingController mobile,
      String gender) {
    ///////////////////////
    DioHelper.postData(url: ADDTEACHER, data: {
      "firstName": first.value.text,
      "lastName": last.value.text,
      "gender": gender,
      "country": country,
      "city": CityC.value.text,
      "address": address.value.text,
      "email": email.value.text,
      "phone": mobile.value.text,
      "role": "TEACHER",
      "status": "INVITED",
      "school": id
    }).then(((value) {
      // print(value.data);
      if (value.statusCode == 200) {
        teacher = Teacher.fromJson(value.data);
        //  emails.add(teacher.email);
        //    CacheHelper.saveData(key: "teacheremails", value: emails);
        // emails.add(teacher.email);
        //CacheHelper.saveData(key: "emails", value: emails);
        emit(SuccessfulDataUsers());
      } else {
        // isExisting = false;
        emit(ErrorDataUsers(error: "This email is taken"));
      }
    })).catchError((onError) {
      //isExisting = false;
      print("${onError.toString()}");
      emit(ErrorDataUsers(error: onError.toString()));
    });
  }

  void addStudent(
      String id,
      String country,
      TextEditingController CityC,
      TextEditingController address,
      TextEditingController email,
      TextEditingController first,
      TextEditingController last,
      TextEditingController mobile,
      String gender) {
    ///////////////////////
    DioHelper.postData(url: ADDTEACHER, data: {
      "firstName": first.value.text,
      "lastName": last.value.text,
      "gender": gender,
      "country": country,
      "city": CityC.value.text,
      "address": address.value.text,
      "email": email.value.text,
      "phone": mobile.value.text,
      "role": "TEACHER",
      "status": "INVITED",
      "school": id
    }).then(((value) {
      // print(value.data);
      if (value.statusCode == 200) {
        teacher = Teacher.fromJson(value.data);
        //  emails.add(teacher.email);
        //    CacheHelper.saveData(key: "teacheremails", value: emails);
        // emails.add(teacher.email);
        //CacheHelper.saveData(key: "emails", value: emails);
        emit(SuccessfulDataUsers());
      } else {
        // isExisting = false;
        emit(ErrorDataUsers(error: "This email is taken"));
      }
    })).catchError((onError) {
      //isExisting = false;
      print("${onError.toString()}");
      emit(ErrorDataUsers(error: onError.toString()));
    });
  }
}
