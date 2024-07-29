// import 'dart:convert';

import 'dart:convert';

class WisataBuatanResponseModel {
  final List<Buatan> data;

  WisataBuatanResponseModel({
    required this.data,
  });

  factory WisataBuatanResponseModel.fromJson(String str) =>
      WisataBuatanResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WisataBuatanResponseModel.fromMap(Map<String, dynamic> json) =>
      WisataBuatanResponseModel(
        data: List<Buatan>.from(json["data"].map((x) => Buatan.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Buatan {
  final String id;
  final String idKategori;
  final String idUser;
  final String nama;
  final String alamat;
  final String atraksiWisata;
  final String fasilitas;
  final String destinasi;
  final String deskripsi;
  final String namaPengelola;
  final String noPengelola;
  final String hariBuka;
  final String jamBuka;
  final String jamTutup;
  final String foto;
  final String sumberFoto;
  final String lat;
  final String lng;
  final int rekomendasi;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int commentAtraksiCount;
  int likeAtraksiCount;
  final User user;
  bool? selfLiked;

  Buatan({
    required this.id,
    required this.idKategori,
    required this.idUser,
    required this.nama,
    required this.alamat,
    required this.atraksiWisata,
    required this.fasilitas,
    required this.destinasi,
    required this.deskripsi,
    required this.namaPengelola,
    required this.noPengelola,
    required this.hariBuka,
    required this.jamBuka,
    required this.jamTutup,
    required this.foto,
    required this.sumberFoto,
    required this.lat,
    required this.lng,
    required this.rekomendasi,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.commentAtraksiCount,
    required this.likeAtraksiCount,
    required this.user,
    this.selfLiked,
  });

  factory Buatan.fromJson(String str) => Buatan.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Buatan.fromMap(Map<String, dynamic> json) => Buatan(
        id: json["id"],
        idKategori: json["id_kategori"],
        idUser: json["id_user"],
        nama: json["nama"],
        alamat: json["alamat"],
        atraksiWisata: json["atraksi_wisata"],
        fasilitas: json["fasilitas"],
        destinasi: json["destinasi"],
        deskripsi: json["deskripsi"],
        namaPengelola: json["nama_pengelola"],
        noPengelola: json["no_pengelola"],
        hariBuka: json["hari_buka"],
        jamBuka: json["jam_buka"],
        jamTutup: json["jam_tutup"],
        foto: json["foto"],
        sumberFoto: json["sumber_foto"],
        lat: json["lat"],
        lng: json["lng"],
        rekomendasi: json["rekomendasi"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        commentAtraksiCount: json["comment_atraksi_count"],
        likeAtraksiCount: json["like_atraksi_count"],
        user: User.fromMap(json["user"]),
        selfLiked: json['like_atraksi'].length > 0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "id_kategori": idKategori,
        "id_user": idUser,
        "nama": nama,
        "alamat": alamat,
        "atraksi_wisata": atraksiWisata,
        "fasilitas": fasilitas,
        "destinasi": destinasi,
        "deskripsi": deskripsi,
        "nama_pengelola": namaPengelola,
        "no_pengelola": noPengelola,
        "hari_buka": hariBuka,
        "jam_buka": jamBuka,
        "jam_tutup": jamTutup,
        "foto": foto,
        "sumber_foto": sumberFoto,
        "lat": lat,
        "lng": lng,
        "rekomendasi": rekomendasi,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "comment_atraksi_count": commentAtraksiCount,
        "like_atraksi_count": likeAtraksiCount,
        "user": user.toMap(),
        "selfLiked": selfLiked,
      };
}

class User {
  final String id;
  final String nama;

  User({
    required this.id,
    required this.nama,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        nama: json["nama"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
      };
}
