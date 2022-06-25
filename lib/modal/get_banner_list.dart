// To parse this JSON data, do
//
//     final getBannerList = getBannerListFromJson(jsonString);

import 'dart:convert';

GetBannerList getBannerListFromJson(String str) =>
    GetBannerList.fromJson(json.decode(str));

String getBannerListToJson(GetBannerList data) => json.encode(data.toJson());

class GetBannerList {
  bool success;
  String message;
  Data data;
  GetBannerList({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetBannerList.fromJson(Map<String, dynamic> json) => GetBannerList(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  List<Banner> banners;
  Data({
    required this.banners,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        banners:
            List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
      };
}

class Banner {
  int id;
  String name;
  String image;
  DateTime createdAt;
  dynamic updatedAt;
  int status;
  dynamic deletedAt;
  Banner({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.deletedAt,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        status: json["status"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "status": status,
        "deleted_at": deletedAt,
      };
}
