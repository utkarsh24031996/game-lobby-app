import 'dart:convert';

SendOtp sendOtpFromJson(String str) => SendOtp.fromJson(json.decode(str));

String sendOtpToJson(SendOtp data) => json.encode(data.toJson());

class SendOtp {
  bool success;
  String message;
  SendOtp({
    required this.success,
    required this.message,
  });

  factory SendOtp.fromJson(Map<String, dynamic> json) => SendOtp(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
