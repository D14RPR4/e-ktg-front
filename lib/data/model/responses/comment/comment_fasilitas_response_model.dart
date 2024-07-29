import 'dart:convert';

class CommentHotelResponseModel {
  final String message;

  CommentHotelResponseModel({
    required this.message,
  });

  factory CommentHotelResponseModel.fromJson(String str) =>
      CommentHotelResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentHotelResponseModel.fromMap(Map<String, dynamic> json) =>
      CommentHotelResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
      };
}
