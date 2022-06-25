import 'dart:convert';

LogoutModal logoutModalFromJson(String str) =>
    LogoutModal.fromJson(json.decode(str));

String logoutModalToJson(LogoutModal data) => json.encode(data.toJson());

class LogoutModal {
  String message;
  LogoutModal({
    required this.message,
  });

  factory LogoutModal.fromJson(Map<String, dynamic> json) => LogoutModal(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
