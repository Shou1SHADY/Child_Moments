class School {
  String? status;
  bool? verified;
  int? volumeDiscount;
  int? activeStudentsNumber;
  int? inactiveStudentsNumber;
  String? sId;
  String? role;
  String? schoolName;
  String? schoolID;
  String? country;
  String? city;
  String? address;
  String? phone;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? validateUntil;
  String? createdAt;
  String? updatedAt;
  int? iV;

  School(
      {this.status,
      this.verified,
      this.volumeDiscount,
      this.activeStudentsNumber,
      this.inactiveStudentsNumber,
      this.sId,
      this.role,
      this.schoolName,
      this.schoolID,
      this.country,
      this.city,
      this.address,
      this.phone,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.validateUntil,
      this.createdAt,
      this.updatedAt,
      this.iV});

  School.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    verified = json['verified'];
    volumeDiscount = json['volumeDiscount'];
    activeStudentsNumber = json['activeStudentsNumber'];
    inactiveStudentsNumber = json['inactiveStudentsNumber'];
    sId = json['_id'];
    role = json['role'];
    schoolName = json['schoolName'];
    schoolID = json['schoolID'];
    country = json['country'];
    city = json['city'];
    address = json['address'];
    phone = json['phone'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    validateUntil = json['validateUntil'];
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
    data['role'] = this.role;
    data['schoolName'] = this.schoolName;
    data['schoolID'] = this.schoolID;
    data['country'] = this.country;
    data['city'] = this.city;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['validateUntil'] = this.validateUntil;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
