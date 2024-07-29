import 'dart:convert';

class CommentAlamRequestModel {
  final String comment;

  CommentAlamRequestModel({
    required this.comment,
  });

  factory CommentAlamRequestModel.fromJson(String str) =>
      CommentAlamRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentAlamRequestModel.fromMap(Map<String, dynamic> json) =>
      CommentAlamRequestModel(
        comment: json["comment"],
      );

  Map<String, dynamic> toMap() => {
        "comment": comment,
      };
}
