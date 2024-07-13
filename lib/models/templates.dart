import 'package:child_moments/models/question.dart';

class Templates {
  String? sId;
  String? templateTitle;
  String? language;
  String? templateDescription;
  List<Questions>? questions;
  String? createdAt;
  String? author;
  int? iV;

  Templates(
      {this.sId,
      this.templateTitle,
      this.language,
      this.templateDescription,
      this.questions,
      this.createdAt,
      this.author,
      this.iV});

  Templates.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    templateTitle = json['templateTitle'];
    language = json['language'];
    templateDescription = json['templateDescription'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    author = json['author'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['templateTitle'] = this.templateTitle;
    data['language'] = this.language;
    data['templateDescription'] = this.templateDescription;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    data['author'] = this.author;
    data['__v'] = this.iV;
    return data;
  }
}
