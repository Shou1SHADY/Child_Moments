import 'package:child_moments/core/Local/shared_pref.dart';
import 'package:child_moments/models/Login_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/Network/Constant.dart';
import '../../core/Network/Dio.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  User users = User();

  void getUsers(TextEditingController _emailC, TextEditingController _passC) {
    // if (CacheHelper.getData(key: "email") != null &&
    //     CacheHelper.getData(key: "password") != null) {
    //   // print("SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
    //   emit(SuccessfulDataUsers());
    // }
    //  else {
    DioHelper.postData(
            url: LOGIN,
            data: {"email": _emailC.value.text, "password": _passC.value.text})
        .then(((value) {
      emit(LoadingDataUsers());
      if (value.statusCode == 200) {
        //for (var i in value.data) {

        users = User.fromJson(value.data);
        if (users.role == "SCHOOL") {
          CacheHelper.saveData(key: "email", value: "$_emailC");
          CacheHelper.saveData(key: "password", value: "$_passC");
          emit(SuccessfulDataUsers());
        }
        //  }
        else {
          emit(ErrorDataUsers(error: "Server is busy please try again later"));
        }
      } else {
        emit(ErrorDataUsers(error: "Server is busy please try again later"));
      }
    })).catchError((onError) {
      emit(ErrorDataUsers(
          error: "${"Server is busy or User does not exist !"}"));
    });
  }
}
//}
