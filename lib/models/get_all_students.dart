import 'package:child_moments/models/kid.dart';

class GetAllStudents {
  int? status;
  List<Kid>? data;

  GetAllStudents({this.status, this.data});

  GetAllStudents.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Kid>[];
      json['data'].forEach((v) {
        data!.add(new Kid.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
