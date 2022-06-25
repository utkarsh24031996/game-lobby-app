import 'dart:convert';

SignInModal signInModalFromJson(String str) =>
    SignInModal.fromJson(json.decode(str));

String signInModalToJson(SignInModal data) => json.encode(data.toJson());

class SignInModal {
  bool success;
  String message;
  SignInModal({
    required this.success,
    required this.message,
  });

  factory SignInModal.fromJson(Map<String, dynamic> json) => SignInModal(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
