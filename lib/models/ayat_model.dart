class Ayat {
  final int? ayatSurah;
  final String? textArab;
  final String? textIndo;
  final String? textTrans;

  Ayat({
    this.ayatSurah,
    this.textArab,
    this.textIndo,
    this.textTrans,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) {
    return Ayat(
        ayatSurah: json['ayahs']['number'],
        textArab: json['ayahs']['text']['ar'],
        textIndo: json['ayahs']['text']['id'],
        textTrans: json['ayahs']['translation']['id']);
  }
}
