import 'dart:convert';

class LikeHotelResponseModel {
  final String message;

  LikeHotelResponseModel({
    required this.message,
  });

  factory LikeHotelResponseModel.fromJson(String str) =>
      LikeHotelResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LikeHotelResponseModel.fromMap(Map<String, dynamic> json) =>
      LikeHotelResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
      };
}
