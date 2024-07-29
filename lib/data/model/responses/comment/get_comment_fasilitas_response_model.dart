import 'dart:convert';

class GetCommentHotelResponseModel {
  final List<Comment> comment;

  GetCommentHotelResponseModel({
    required this.comment,
  });

  factory GetCommentHotelResponseModel.fromJson(String str) =>
      GetCommentHotelResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetCommentHotelResponseModel.fromMap(Map<String, dynamic> json) =>
      GetCommentHotelResponseModel(
        comment:
            List<Comment>.from(json["comment"].map((x) => Comment.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "comment": List<dynamic>.from(comment.map((x) => x.toMap())),
      };
}

class Comment {
  final String id;
  final String userId;
  final String postId;
  final String comment;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;

  Comment({
    required this.id,
    required this.userId,
    required this.postId,
    required this.comment,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory Comment.fromJson(String str) => Comment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Comment.fromMap(Map<String, dynamic> json) => Comment(
        id: json["id"],
        userId: json["user_id"],
        postId: json["post_id"],
        comment: json["comment"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "post_id": postId,
        "comment": comment,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toMap(),
      };
}

class User {
  final int id;
  final String name;

  User({
    required this.id,
    required this.name,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
