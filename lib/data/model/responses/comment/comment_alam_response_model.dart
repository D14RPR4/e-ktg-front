import 'dart:convert';

class CommentAlamResponseModel {
  final String message;

  CommentAlamResponseModel({
    required this.message,
  });

  factory CommentAlamResponseModel.fromJson(String str) =>
      CommentAlamResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentAlamResponseModel.fromMap(Map<String, dynamic> json) =>
      CommentAlamResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
      };
}
