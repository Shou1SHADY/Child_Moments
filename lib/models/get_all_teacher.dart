import 'package:child_moments/models/teacher.dart';

class AllTeachers {
  int? status;
  List<Teacher>? data;
  String? message;

  AllTeachers({this.status, this.data, this.message});

  AllTeachers.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Teacher>[];
      json['data'].forEach((v) {
        data!.add(new Teacher.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}
