class VerifyOtp {
  bool? success;
  String? message;
  Data? data;

  VerifyOtp({this.success, this.message, this.data});

  VerifyOtp.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? email;
  String? mobile;
  String? gender;
  String? dateOfBirth;
  String? avatar;
  String? status;
  int? isProfileCompleted;

  User(
      {this.name,
      this.email,
      this.mobile,
      this.gender,
      this.dateOfBirth,
      this.avatar,
      this.status,
      this.isProfileCompleted});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    avatar = json['avatar'];
    status = json['status'];
    isProfileCompleted = json['is_profile_completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['gender'] = gender;
    data['date_of_birth'] = dateOfBirth;
    data['avatar'] = avatar;
    data['status'] = status;
    data['is_profile_completed'] = isProfileCompleted;
    return data;
  }
}
