import 'dart:convert';

class LikeAlamResponseModel {
  final String message;

  LikeAlamResponseModel({
    required this.message,
  });

  factory LikeAlamResponseModel.fromJson(String str) =>
      LikeAlamResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LikeAlamResponseModel.fromMap(Map<String, dynamic> json) =>
      LikeAlamResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
      };
}
