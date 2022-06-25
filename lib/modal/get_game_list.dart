// To parse this JSON data, do
//
//     final getGameList = getGameListFromJson(jsonString);

import 'dart:convert';

GetGameList getGameListFromJson(String str) =>
    GetGameList.fromJson(json.decode(str));

String getGameListToJson(GetGameList data) => json.encode(data.toJson());

class GetGameList {
  bool success;
  String message;
  Data data;
  GetGameList({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetGameList.fromJson(Map<String, dynamic> json) => GetGameList(
        success: json["success"] ?? '',
        message: json["message"] ?? '',
        data: Data.fromJson(json["data"] ?? ''),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.games,
  });

  List<Game> games;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        games: List<Game>.from(json["games"].map((x) => Game.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "games": List<dynamic>.from(games.map((x) => x.toJson())),
      };
}

class Game {
  int? id;
  String? name;
  String? icon;
  int? status;
  // DateTime createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  Game({
    required this.id,
    required this.name,
    required this.icon,
    required this.status,
    // required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        icon: json["icon"] ?? '',
        status: json["status"] ?? 0,
        // createdAt: json["created_at"],
        updatedAt: json["updated_at"] ?? '',
        deletedAt: json["deleted_at"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "status": status,
        // "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
