// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.eduDetailTitle,
    this.eduDetailId,
  });

  String? eduDetailTitle;
  String? eduDetailId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        eduDetailTitle: json["edu_detail_title"],
        eduDetailId: json["edu_detail_id"],
      );

  Map<String, dynamic> toJson() => {
        "edu_detail_title": eduDetailTitle,
        "edu_detail_id": eduDetailId,
      };
}
