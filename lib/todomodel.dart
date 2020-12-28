import 'dart:convert';

List<TodoModel> todoModelFromJson(String str) => List<TodoModel>.from(json.decode(str).map((x) => TodoModel.fromJson(x)));

String todoModelToJson(List<TodoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));



class TodoModel {
  TodoModel({
    this.title,
    this.locationType,
    this.woeid,
    this.lattLong,
  });

  String title;
  String locationType;
  int woeid;
  String lattLong;

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
    title: json["title"],
    locationType: json["location_type"],
    woeid: json["woeid"],
    lattLong: json["latt_long"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "location_type": locationType,
    "woeid": woeid,
    "latt_long": lattLong,
  };
}