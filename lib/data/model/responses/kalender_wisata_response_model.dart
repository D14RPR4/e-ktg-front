import 'dart:convert';

class KalenderResponseModel {
  final List<Kalender> data;

  KalenderResponseModel({
    required this.data,
  });

  factory KalenderResponseModel.fromJson(String str) =>
      KalenderResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory KalenderResponseModel.fromMap(Map<String, dynamic> json) =>
      KalenderResponseModel(
        data: List<Kalender>.from(json["data"].map((x) => Kalender.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Kalender {
  final String id;
  final String nama;
  final List<EventWisata> eventWisatas;

  Kalender({
    required this.id,
    required this.nama,
    required this.eventWisatas,
  });

  factory Kalender.fromJson(String str) => Kalender.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Kalender.fromMap(Map<String, dynamic> json) => Kalender(
        id: json["id"],
        nama: json["nama"],
        eventWisatas: List<EventWisata>.from(
            json["event_wisatas"].map((x) => EventWisata.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "event_wisatas": List<dynamic>.from(eventWisatas.map((x) => x.toMap())),
      };
}

class EventWisata {
  final String nama;
  final String deskripsi;
  final String linkEvent;
  final String penyelenggaraEvent;
  final String tempat;
  final String tanggal;
  final String transportasi;
  final String foto;
  final String foto1;
  final String foto2;
  final String sumberFoto;

  EventWisata({
    required this.nama,
    required this.deskripsi,
    required this.linkEvent,
    required this.penyelenggaraEvent,
    required this.tempat,
    required this.tanggal,
    required this.transportasi,
    required this.foto,
    required this.foto1,
    required this.foto2,
    required this.sumberFoto,
  });

  factory EventWisata.fromJson(String str) =>
      EventWisata.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EventWisata.fromMap(Map<String, dynamic> json) => EventWisata(
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        linkEvent: json["link_event"],
        penyelenggaraEvent: json["penyelenggara_event"],
        tempat: json["tempat"],
        tanggal: json["tanggal"],
        transportasi: json["transportasi"],
        foto: json["foto"],
        foto1: json["foto1"],
        foto2: json["foto2"],
        sumberFoto: json["sumber_foto"],
      );

  Map<String, dynamic> toMap() => {
        "nama": nama,
        "deskripsi": deskripsi,
        "link_event": linkEvent,
        "penyelenggara_event": penyelenggaraEvent,
        "tempat": tempat,
        "tanggal": tanggal,
        "transportasi": transportasi,
        "foto": foto,
        "foto1": foto1,
        "foto2": foto2,
        "sumber_foto": sumberFoto,
      };
}
