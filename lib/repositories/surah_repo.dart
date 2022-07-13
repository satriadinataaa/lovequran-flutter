import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lovelyquran/models/surah.dart';
import '../models/ayat.dart';

class SurahRepo {
  Future getData() async {
    const _baseUrl = 'https://api-quran-flutter.herokuapp.com/surah';

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
              url:
                  'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/' +
                      it.elementAt(i)['number'].toString().padLeft(3, '0') +
                      '.mp3',
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
        'https://api-quran-flutter.herokuapp.com/surah/' + sequence.toString();

    late Surah surahData;
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      var rp = jsonDecode(response.body);
      // print(rp.runtimeType);
      if (response.statusCode == 200) {
        // print(rp['data']['ayahs']);
        surahData = Surah(
            arabName: rp['data']['name']['long'],
            idName: rp['data']['name']['transliteration']['id'],
            number: rp['data']['number'],
            url:
                'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/' +
                    rp['data']['number'].toString().padLeft(3, '0') +
                    '.mp3',
            sequence: rp['data']['sequence'],
            asal: rp['data']['revelation']['id'],
            ayat: rp['data']['numberOfVerses']);

        for (var i = 0; i < rp['data']['verses'].length; i++) {
          var ayats = Ayat(
            ayatSurah: rp['data']['verses'][i]['number']['inSurah'],
            textArab: rp['data']['verses'][i]['text']['arab'],
            textIndo: rp['data']['verses'][i]['text']['transliteration']['en'],
            textTrans: rp['data']['verses'][i]['translation']['id'],
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
