import 'dart:convert';

class ValidateRequestModel {
  final String email;

  ValidateRequestModel({
    required this.email,
  });

  factory ValidateRequestModel.fromJson(String str) =>
      ValidateRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ValidateRequestModel.fromMap(Map<String, dynamic> json) =>
      ValidateRequestModel(
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
      };
}
