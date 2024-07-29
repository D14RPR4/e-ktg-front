import 'dart:convert';

class BeritaResponseModel {
  final List<Berita> data;

  BeritaResponseModel({
    required this.data,
  });

  factory BeritaResponseModel.fromJson(String str) =>
      BeritaResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BeritaResponseModel.fromMap(Map<String, dynamic> json) =>
      BeritaResponseModel(
        data: List<Berita>.from(json["data"].map((x) => Berita.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Berita {
  final String id;
  final String judul;
  final String deskripsi;
  final String foto;
  final DateTime createdAt;
  final DateTime updatedAt;

  Berita({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.foto,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Berita.fromJson(String str) => Berita.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Berita.fromMap(Map<String, dynamic> json) => Berita(
        id: json["id"],
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        foto: json["foto"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "judul": judul,
        "deskripsi": deskripsi,
        "foto": foto,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
