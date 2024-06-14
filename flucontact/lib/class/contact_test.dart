// To parse this JSON data, do
//
//     final contactTest = contactTestFromJson(jsonString);

import 'dart:convert';

List<ContactTest> contactTestFromJson(String str) => List<ContactTest>.from(
    json.decode(str).map((x) => ContactTest.fromJson(x)));

String contactTestToJson(List<ContactTest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContactTest {
  int userId;
  int id;
  String title;
  bool completed;

  ContactTest({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory ContactTest.fromJson(Map<String, dynamic> json) => ContactTest(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}

List<ContactTest>? contactTest;
