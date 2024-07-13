import 'package:child_moments/core/Local/shared_pref.dart';
import 'package:child_moments/core/Network/Constant.dart';
import 'package:child_moments/models/school.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../core/Network/Dio.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  bool isExisting = false;
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  // ResponseData responseData = ResponseData();
  static List<String?> emails = [];
  School school = School();

  void RegisterUsers(
    TextEditingController _schoolName,
    TextEditingController _emailC,
    TextEditingController _passC,
    TextEditingController _schoolID,
    String _country,
    TextEditingController _city,
    TextEditingController _Address,
    TextEditingController _firstName,
    TextEditingController _lastName,
    TextEditingController _mobile,
  ) {
    DioHelper.postData(url: SIGNUP, data: {
      "role": "SCHOOL",
      "schoolName": _schoolName.value.text,
      "schoolID": _schoolID.value.text,
      "country": _country,
      "city": _city.value.text,
      "address": _Address.value.text,
      "phone": _mobile.value.text,
      "firstName": _firstName.value.text,
      "lastName": _lastName.value.text,
      "email": _emailC.value.text,
      "password": _passC.value.text,
      "status": "ACTIVE"
    }).then(((value) {
      emit(LoadingDataUsers());
      for (int i = 0; i < emails.length; i++) {
        if (emails[i]!.compareTo(_emailC.value.text) == 0) {
          isExisting = true;
        }
      }
      // if (CacheHelper.getData(key: "emails").toString().contains()) {}

      if (value.statusCode == 200 && isExisting == false) {
        school = School.fromJson(value.data);
        CacheHelper.saveData(key: "schoolid", value: school.sId);
        emails.add(school.email);
        CacheHelper.saveData(key: "emails", value: emails);
        emit(SuccessfulDataUsers());
      } else {
        isExisting = false;
        emit(ErrorDataUsers(error: "this email already existing"));
      }
    })).catchError((onError) {
      isExisting = false;
      emit(ErrorDataUsers(error: "this email already existing"));
    });
  }
}
