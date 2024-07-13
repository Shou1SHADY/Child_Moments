import 'package:child_moments/models/parent.dart';

import 'package:child_moments/models/school.dart';
import 'package:child_moments/models/templates.dart';

class Kid {
  String? avatar;
  String? status;
  String? gender;
  List<Templates>? templates;
  String? sId;
  String? firstName;
  String? lastName;
  String? birthday;
  String? country;
  String? city;
  String? address;
  String? allergies;
  String? medications;
  Parent? parent;
  String? studentID;
  School? school;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Kid(
      {this.avatar,
      this.status,
      this.gender,
      this.templates,
      this.sId,
      this.firstName,
      this.lastName,
      this.birthday,
      this.country,
      this.city,
      this.address,
      this.allergies,
      this.medications,
      this.parent,
      this.studentID,
      this.school,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Kid.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    gender = json['gender'];
    if (json['templates'] != null) {
      templates = <Templates>[];
      json['templates'].forEach((v) {
        templates!.add(new Templates.fromJson(v));
      });
    }
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    birthday = json['birthday'];
    country = json['country'];
    city = json['city'];
    address = json['address'];
    allergies = json['allergies'];
    medications = json['medications'];
    parent =
        json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
    studentID = json['studentID'];
    school =
        json['school'] != null ? new School.fromJson(json['school']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['gender'] = this.gender;
    if (this.templates != null) {
      data['templates'] = this.templates!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['birthday'] = this.birthday;
    data['country'] = this.country;
    data['city'] = this.city;
    data['address'] = this.address;
    data['allergies'] = this.allergies;
    data['medications'] = this.medications;
    if (this.parent != null) {
      data['parent'] = this.parent!.toJson();
    }
    data['studentID'] = this.studentID;
    if (this.school != null) {
      data['school'] = this.school!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
