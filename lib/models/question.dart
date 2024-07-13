class Questions {
  int? iId;
  String? questionTitle;
  String? questionType;
  bool? required;
  List<String>? options;

  Questions(
      {this.iId,
      this.questionTitle,
      this.questionType,
      this.required,
      this.options});

  Questions.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    questionTitle = json['questionTitle'];
    questionType = json['questionType'];
    required = json['required'];
    options = json['options'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.iId;
    data['questionTitle'] = this.questionTitle;
    data['questionType'] = this.questionType;
    data['required'] = this.required;
    data['options'] = this.options;
    return data;
  }
}
