class Ayat {
  final int ayatSurah;
  final String textArab;
  final String textIndo;
  final String textTrans;

  Ayat({
    this.ayatSurah = 0,
    this.textArab = "",
    this.textIndo = "",
    this.textTrans = "",
  });

  factory Ayat.fromMap(Map<String, dynamic> json) {
    return Ayat(
        ayatSurah: json['ayahs']['number'],
        textArab: json['ayahs']['text']['ar'],
        textIndo: json['ayahs']['text']['id'],
        textTrans: json['ayahs']['translation']['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      "ayatSurah": ayatSurah,
      "textArab": textArab,
      "textIndo": textIndo,
      "textTrans": textTrans
    };
  }
}
