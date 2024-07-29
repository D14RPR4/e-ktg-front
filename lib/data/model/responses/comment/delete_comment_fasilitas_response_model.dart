import 'dart:convert';

class DeleteCommentHotelResponseModel {
  final String message;

  DeleteCommentHotelResponseModel({
    required this.message,
  });

  factory DeleteCommentHotelResponseModel.fromJson(String str) =>
      DeleteCommentHotelResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeleteCommentHotelResponseModel.fromMap(Map<String, dynamic> json) =>
      DeleteCommentHotelResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
      };
}
