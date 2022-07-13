import 'ayat_model.dart';

class Surah {
  final int? number;
  final int? sequence;
  final String? arabName;
  final String? idName;
  final String? asal;
  final int? ayat;
  final String? url;
  List<Ayat>? ayatList = [];

  Surah(
      {this.number,
      this.sequence,
      this.arabName,
      this.idName,
      this.asal,
      this.url,
      this.ayat});

  setAyat(List<Ayat> ayatList) {
    this.ayatList = ayatList;
  }

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      number: json['number'],
      sequence: json['sequence'],
      arabName: json['name']['short'],
      idName: json['name']['transliteration']['id'],
      asal: json['revelation']['id'],
      ayat: json['numberOfVerses'],
      url: 'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/' +
          json['number'].toString().padLeft(3, '0') +
          '.mp3',
    );
  }
}
