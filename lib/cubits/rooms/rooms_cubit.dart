import 'package:child_moments/core/Local/shared_pref.dart';
import 'package:child_moments/core/Network/Constant.dart';
import 'package:child_moments/models/school.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../core/Network/Dio.dart';

part 'rooms_state.dart';

class RoomCubit extends Cubit<RoomState> {
  bool isExisting = false;
  RoomCubit() : super(RoomInitial());

  static RoomCubit get(context) => BlocProvider.of(context);

  void addRoom() {}
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
