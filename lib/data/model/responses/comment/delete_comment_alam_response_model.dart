import 'dart:convert';

class DeleteCommentAlamResponseModel {
  final String message;

  DeleteCommentAlamResponseModel({
    required this.message,
  });

  factory DeleteCommentAlamResponseModel.fromJson(String str) =>
      DeleteCommentAlamResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeleteCommentAlamResponseModel.fromMap(Map<String, dynamic> json) =>
      DeleteCommentAlamResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
      };
}
