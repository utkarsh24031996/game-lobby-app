class UpdateProfile {
  bool? success;
  String? message;
  Data? data;

  UpdateProfile({this.success, this.message, this.data});

  UpdateProfile.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['avatar'] = this.avatar;
    data['status'] = this.status;
    data['is_profile_completed'] = this.isProfileCompleted;
    return data;
  }
}