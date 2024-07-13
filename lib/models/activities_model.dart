import 'package:flutter/cupertino.dart';

class ActivitiesModel {
  String? name;
  String? roomName;
  String? food;
  String? learning;
  String? notes;
  String? naps;
  String? photos;
  String? videos;
  String? potty;
  String? bottle;
  String? supplies;
  String? mood;

  ActivitiesModel(
    @required this.name,
    @required this.roomName,
    @required this.food,
    @required this.learning,
    @required this.notes,
    @required this.naps,
    @required this.photos,
    @required this.videos,
    @required this.potty,
    @required this.bottle,
    @required this.supplies,
    @required this.mood,
  );
}
