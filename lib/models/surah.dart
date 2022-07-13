import 'dart:convert';
import '../models/ayat.dart';

List<Surah> postFromJson(String str) =>
    List<Surah>.from(json.decode(str).map((x) => Surah.fromMap(x)));

class Surah {
  final int number;
  final int sequence;
  final String arabName;
  final String idName;
  final String asal;
  final int ayat;
  final String url;
  List<Ayat> ayatList = [];

  Surah(
      {this.number = 0,
      this.sequence = 0,
      this.arabName = "",
      this.idName = "",
      this.asal = "",
      this.url = "",
      this.ayat = 0});

  setAyat(List<Ayat> ayatList) {
    this.ayatList = ayatList;
  }

  factory Surah.fromMap(Map<String, dynamic> json) {
    return Surah(
      number: json['number'],
      sequence: json['sequence'],
      arabName: json['name']['short'],
      idName: json['name']['transliteration']['id'],
      asal: json['revelation']['id'],
      ayat: json['numberOfVerses'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "number": number,
      "sequence": sequence,
      "arabName": arabName,
      "idName": idName,
      "asal": asal,
      "ayat": ayat
    };
  }
}
