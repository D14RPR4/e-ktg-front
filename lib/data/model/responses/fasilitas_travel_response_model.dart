import 'dart:convert';

class FasilitasTravelResponseModel {
  final List<Travel> data;

  FasilitasTravelResponseModel({
    required this.data,
  });

  factory FasilitasTravelResponseModel.fromJson(String str) =>
      FasilitasTravelResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FasilitasTravelResponseModel.fromMap(Map<String, dynamic> json) =>
      FasilitasTravelResponseModel(
        data: List<Travel>.from(json["data"].map((x) => Travel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Travel {
  final String id;
  final String idKategori;
  final String idUser;
  final String nama;
  final String alamat;
  final String fasilitas;
  final String deskripsi;
  final String namaPengelola;
  final String noPengelola;
  final String hariBuka;
  final String jamBuka;
  final String jamTutup;
  final String foto;
  final String foto1;
  final String foto2;
  final String sumberFoto;
  final String link;
  final int rating;
  final String lat;
  final String lng;
  final int rekomendasi;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int commentFasilitasCount;
  int likeFasilitasCount;
  final User user;
  bool? selfLiked;

  Travel({
    required this.id,
    required this.idKategori,
    required this.idUser,
    required this.nama,
    required this.alamat,
    required this.fasilitas,
    required this.deskripsi,
    required this.namaPengelola,
    required this.noPengelola,
    required this.hariBuka,
    required this.jamBuka,
    required this.jamTutup,
    required this.foto,
    required this.foto1,
    required this.foto2,
    required this.sumberFoto,
    required this.link,
    required this.rating,
    required this.lat,
    required this.lng,
    required this.rekomendasi,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.commentFasilitasCount,
    required this.likeFasilitasCount,
    required this.user,
    this.selfLiked,
  });

  factory Travel.fromJson(String str) => Travel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Travel.fromMap(Map<String, dynamic> json) => Travel(
        id: json["id"],
        idKategori: json["id_kategori"],
        idUser: json["id_user"],
        nama: json["nama"],
        alamat: json["alamat"],
        fasilitas: json["fasilitas"],
        deskripsi: json["deskripsi"],
        namaPengelola: json["nama_pengelola"],
        noPengelola: json["no_pengelola"],
        hariBuka: json["hari_buka"],
        jamBuka: json["jam_buka"],
        jamTutup: json["jam_tutup"],
        foto: json["foto"],
        foto1: json["foto1"],
        foto2: json["foto2"],
        sumberFoto: json["sumber_foto"],
        link: json["link"],
        rating: json["rating"],
        lat: json["lat"],
        lng: json["lng"],
        rekomendasi: json["rekomendasi"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        commentFasilitasCount: json["comment_fasilitas_count"],
        likeFasilitasCount: json["like_fasilitas_count"],
        user: User.fromMap(json["user"]),
        selfLiked: json['like_fasilitas'].length > 0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "id_kategori": idKategori,
        "id_user": idUser,
        "nama": nama,
        "alamat": alamat,
        "fasilitas": fasilitas,
        "deskripsi": deskripsi,
        "nama_pengelola": namaPengelola,
        "no_pengelola": noPengelola,
        "hari_buka": hariBuka,
        "jam_buka": jamBuka,
        "jam_tutup": jamTutup,
        "foto": foto,
        "foto1": foto1,
        "foto2": foto2,
        "sumber_foto": sumberFoto,
        "link": link,
        "rating": rating,
        "lat": lat,
        "lng": lng,
        "rekomendasi": rekomendasi,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "comment_fasilitas_count": commentFasilitasCount,
        "like_fasilitas_count": likeFasilitasCount,
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
