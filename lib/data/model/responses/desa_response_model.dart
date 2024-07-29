import 'dart:convert';

class DesaWisataResponseModel {
  final List<Desa> data;

  DesaWisataResponseModel({
    required this.data,
  });

  factory DesaWisataResponseModel.fromJson(String str) =>
      DesaWisataResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DesaWisataResponseModel.fromMap(Map<String, dynamic> json) =>
      DesaWisataResponseModel(
        data: List<Desa>.from(json["data"].map((x) => Desa.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Desa {
  final String id;
  final String namaDesaWisata;
  final String linkWisata;
  final String deskripsi;
  final String linkJadesta;
  final String foto;
  final String foto1;
  final String foto2;
  final String lat;
  final String lng;
  final DateTime createdAt;
  final DateTime updatedAt;

  Desa({
    required this.id,
    required this.namaDesaWisata,
    required this.linkWisata,
    required this.deskripsi,
    required this.linkJadesta,
    required this.foto,
    required this.foto1,
    required this.foto2,
    required this.lat,
    required this.lng,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Desa.fromJson(String str) => Desa.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Desa.fromMap(Map<String, dynamic> json) => Desa(
        id: json["id"],
        namaDesaWisata: json["nama_desa_wisata"],
        linkWisata: json["link_wisata"],
        deskripsi: json["deskripsi"],
        linkJadesta: json["link_jadesta"],
        foto: json["foto"],
        foto1: json["foto1"],
        foto2: json["foto2"],
        lat: json["lat"],
        lng: json["lng"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nama_desa_wisata": namaDesaWisata,
        "link_wisata": linkWisata,
        "deskripsi": deskripsi,
        "link_jadesta": linkJadesta,
        "foto": foto,
        "foto1": foto1,
        "foto2": foto2,
        "lat": lat,
        "lng": lng,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
