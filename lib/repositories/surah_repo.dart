import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lovelyquran/models/surah.dart';
import '../models/ayat.dart';

class SurahRepo {
  Future getData() async {
    const _baseUrl = 'https://api.quran.sutanlab.id/surah';

    List<Surah> surah = [];
    late Surah surahData;
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      var rp = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Iterable it = rp['data'];

        for (int i = 0; i < it.length; i++) {
          surahData = Surah(
              number: it.elementAt(i)['number'],
              sequence: it.elementAt(i)['sequence'],
              ayat: it.elementAt(i)['numberOfVerses'],
              arabName: it.elementAt(i)['name']['short'],
              idName: it.elementAt(i)['name']['transliteration']['id'],
              asal: it.elementAt(i)['revelation']['id']);
          surah.add(surahData);
        }
      }

      return surah;
    } catch (e) {
      throw Exception('Failed to load album');
    }
  }

  Future getSurahDetail(int sequence) async {
    var _baseUrl =
        'https://quran-endpoint.vercel.app/quran/' + sequence.toString();

    late Surah surahData;
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      var rp = jsonDecode(response.body);
      // print(rp.runtimeType);
      if (response.statusCode == 200) {
        // print(rp['data']['ayahs']);
        surahData = Surah(
            arabName: rp['data']['asma']['ar']['long'],
            idName: rp['data']['asma']['id']['long'],
            number: rp['data']['number'],
            sequence: rp['data']['sequence'],
            asal: rp['data']['type']['id']);

        for (var i = 0; i < rp['data']['ayahs'].length; i++) {
          var ayats = Ayat(
            ayatSurah: rp['data']['ayahs'][i]['number']['inquran'],
            textArab: rp['data']['ayahs'][i]['text']['ar'],
            textIndo: rp['data']['ayahs'][i]['text']['read'],
            textTrans: rp['data']['ayahs'][i]['translation']['id'],
          );
          surahData.ayatList.add(ayats);
        }
      }
      // print(surahData.ayatList[0]);
      return surahData;
    } catch (e) {
      throw Exception('Failed to load album');
    }
  }
}
