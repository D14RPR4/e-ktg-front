import 'dart:convert';

class ValidateResponseModel {
  final String message;

  ValidateResponseModel({
    required this.message,
  });

  factory ValidateResponseModel.fromJson(String str) =>
      ValidateResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ValidateResponseModel.fromMap(Map<String, dynamic> json) =>
      ValidateResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
      };
}
