import 'package:child_moments/core/Local/shared_pref.dart';
import 'package:child_moments/core/Network/Constant.dart';
import 'package:child_moments/models/school.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/Network/Dio.dart';
import '../../../models/teacher.dart';

part 'add_kid_state.dart';

class AddKidCubit extends Cubit<AddKidState> {
  bool isExisting = false;
  AddKidCubit() : super(AddKidInitial());
  static List<String?> emails = [];
  static AddKidCubit get(context) => BlocProvider.of(context);

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
    // print(id);
    // print(country);
    // print(CityC.value.text);
    // print(address.value.text);
    // print(email.value.text);
    // print(first.value.text);
    // print(last.value.text);
    // print(mobile.value.text);
    // print(gender);
    ///////////////////////
    DioHelper.postData(url: ADDKID, data: {
      "student": {
        "firstName": "studentdsd.firstName",
        "lastName": "student.lastName",
        "birthday": "student.birthday",
        "country": "student.country",
        "city": "student.city",
        "address": "student.address",
        "allergies": "student.allergies",
        "medications": "student.medications",
        "gender": "student.gender",
        "parent": "parent._id",
        "templates": "student.templates",
        "status": "INVITED",
        "studentID": "stsdsudent.studentI"
      },
      "school": "6364f3b8ed482e001638ab90"
    }).then(((value) {
      // for (int i = 0; i < emails.length; i++) {
      //   if (emails[i]!.compareTo(email.value.text) == 0) {
      //     isExisting = true;
      //   }
      // }
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
  // "name": "room-name",
  //       "teachers": ["teacher-id"],
  //       "students": ["student-id"],
  //       "subjects": [
  //           "example"
  //       ],
  //       "meals": [
  //           "example"
  //       ]
  //   },
  //   "school": "school._id"

}
