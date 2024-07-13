class Parent {
  String? status;
  bool? verified;
  int? volumeDiscount;
  int? activeStudentsNumber;
  int? inactiveStudentsNumber;
  String? sId;
  String? email;
  String? firstName;
  String? lastName;
  String? phone;
  String? role;
  String? validateUntil;
  String? password;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Parent(
      {this.status,
      this.verified,
      this.volumeDiscount,
      this.activeStudentsNumber,
      this.inactiveStudentsNumber,
      this.sId,
      this.email,
      this.firstName,
      this.lastName,
      this.phone,
      this.role,
      this.validateUntil,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Parent.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    verified = json['verified'];
    volumeDiscount = json['volumeDiscount'];
    activeStudentsNumber = json['activeStudentsNumber'];
    inactiveStudentsNumber = json['inactiveStudentsNumber'];
    sId = json['_id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
    role = json['role'];
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
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['role'] = this.role;
    data['validateUntil'] = this.validateUntil;
    data['password'] = this.password;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
