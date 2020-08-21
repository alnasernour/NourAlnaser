// New
import 'dart:convert';

Users userFromJson(String str) {
  final jsonData = json.decode(str);
  return Users.fromMap(jsonData);
}

String userToJson(Users data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Users {
  int id;
  int userId;
  String title;
  String body;

  Users({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

  factory Users.fromMap(Map<String, dynamic> json) => new Users(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "userId": userId,
        "title": title,
        "body": body,
      };
}
