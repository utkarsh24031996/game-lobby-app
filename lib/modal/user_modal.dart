// To parse this JSON data, do
//
//     final userModal = userModalFromJson(jsonString);

import 'dart:convert';

UserModal userModalFromJson(String str) => UserModal.fromJson(json.decode(str));

String userModalToJson(UserModal data) => json.encode(data.toJson());

class UserModal {
  String? name;
  String? email;
  String? mobile;
  dynamic gender;
  dynamic dateOfBirth;
  String? avatar;
  String? status;
  int? isProfileCompleted;
  UserModal({
    required this.name,
    required this.email,
    required this.mobile,
    required this.gender,
    required this.dateOfBirth,
    required this.avatar,
    required this.status,
    required this.isProfileCompleted,
  });

  factory UserModal.fromJson(Map<String, dynamic> json) => UserModal(
        name: json["name"]??'',
        email: json["email"]??'',
        mobile: json["mobile"]??'',
        gender: json["gender"]??'',
        dateOfBirth: json["date_of_birth"]??'',
        avatar: json["avatar"]??'',
        status: json["status"]??'',
        isProfileCompleted: json["is_profile_completed"]??0,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "mobile": mobile,
        "gender": gender,
        "date_of_birth": dateOfBirth,
        "avatar": avatar,
        "status": status,
        "is_profile_completed": isProfileCompleted,
      };
}
