import '../../models/surah_model.dart';
import '../../models/ayat_model.dart';

class SurahViewModel {
  final Surah surah;
  SurahViewModel({required this.surah});

  int? get number {
    return surah.number;
  }

  int? get sequence {
    return surah.sequence;
  }

  String? get arabName {
    return surah.arabName;
  }

  String? get idName {
    return surah.idName;
  }

  String? get asal {
    return surah.asal;
  }

  int? get ayat {
    return surah.ayat;
  }

  String? get url {
    return surah.url;
  }

  List<Ayat>? get ayatList {
    return surah.ayatList;
  }
}
