class PrayerTimeResponse {
  bool status;
  Data data;

  PrayerTimeResponse({required this.status, required this.data});

  factory PrayerTimeResponse.fromJson(Map<String, dynamic> json) {
    return PrayerTimeResponse(
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  String id;
  String lokasi;
  String daerah;
  Koordinat koordinat;
  Jadwal jadwal;

  Data({
    required this.id,
    required this.lokasi,
    required this.daerah,
    required this.koordinat,
    required this.jadwal,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      lokasi: json['lokasi'],
      daerah: json['daerah'],
      koordinat: Koordinat.fromJson(json['koordinat']),
      jadwal: Jadwal.fromJson(json['jadwal']),
    );
  }
}

class Koordinat {
  double lat;
  double lon;
  String lintang;
  String bujur;

  Koordinat({
    required this.lat,
    required this.lon,
    required this.lintang,
    required this.bujur,
  });

  factory Koordinat.fromJson(Map<String, dynamic> json) {
    return Koordinat(
      lat: json['lat'],
      lon: json['lon'],
      lintang: json['lintang'],
      bujur: json['bujur'],
    );
  }
}

class Jadwal {
  String tanggal;
  String imsak;
  String subuh;
  String terbit;
  String dhuha;
  String dzuhur;
  String ashar;
  String maghrib;
  String isya;
  String date;

  Jadwal({
    required this.tanggal,
    required this.imsak,
    required this.subuh,
    required this.terbit,
    required this.dhuha,
    required this.dzuhur,
    required this.ashar,
    required this.maghrib,
    required this.isya,
    required this.date,
  });

  factory Jadwal.fromJson(Map<String, dynamic> json) {
    return Jadwal(
      tanggal: json['tanggal'],
      imsak: json['imsak'],
      subuh: json['subuh'],
      terbit: json['terbit'],
      dhuha: json['dhuha'],
      dzuhur: json['dzuhur'],
      ashar: json['ashar'],
      maghrib: json['maghrib'],
      isya: json['isya'],
      date: json['date'],
    );
  }
}
