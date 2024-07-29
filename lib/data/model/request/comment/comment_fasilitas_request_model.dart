import 'dart:convert';

class CommentHotelRequestModel {
  final String comment;

  CommentHotelRequestModel({
    required this.comment,
  });

  factory CommentHotelRequestModel.fromJson(String str) =>
      CommentHotelRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentHotelRequestModel.fromMap(Map<String, dynamic> json) =>
      CommentHotelRequestModel(
        comment: json["comment"],
      );

  Map<String, dynamic> toMap() => {
        "comment": comment,
      };
}
