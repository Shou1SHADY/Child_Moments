//String? avatar;
//String? name;
//String? email;
// String? address;
// String? mobile;
// String? gender;
//String? status;
import 'package:child_moments/models/school.dart';

class Teacher {
  String? status;
  bool? verified;
  int? volumeDiscount;
  int? activeStudentsNumber;
  int? inactiveStudentsNumber;
  String? sId;
  String? firstName;
  String? lastName;
  String? gender;
  String? country;
  String? city;
  String? address;
  String? email;
  String? phone;
  String? role;
  School? school;
  String? validateUntil;
  String? password;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Teacher(
      {this.status,
      this.verified,
      this.volumeDiscount,
      this.activeStudentsNumber,
      this.inactiveStudentsNumber,
      this.sId,
      this.firstName,
      this.lastName,
      this.gender,
      this.country,
      this.city,
      this.address,
      this.email,
      this.phone,
      this.role,
      this.school,
      this.validateUntil,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Teacher.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    verified = json['verified'];
    volumeDiscount = json['volumeDiscount'];
    activeStudentsNumber = json['activeStudentsNumber'];
    inactiveStudentsNumber = json['inactiveStudentsNumber'];
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    country = json['country'];
    city = json['city'];
    address = json['address'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    school =
        json['school'] != null ? new School.fromJson(json['school']) : null;
    validateUntil = json['validateUntil'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['verified'] = this.verified;
    data['volumeDiscount'] = this.volumeDiscount;
    data['activeStudentsNumber'] = this.activeStudentsNumber;
    data['inactiveStudentsNumber'] = this.inactiveStudentsNumber;
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['gender'] = this.gender;
    data['country'] = this.country;
    data['city'] = this.city;
    data['address'] = this.address;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['role'] = this.role;
    if (this.school != null) {
      data['school'] = this.school!.toJson();
    }
    data['validateUntil'] = this.validateUntil;
    data['password'] = this.password;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
