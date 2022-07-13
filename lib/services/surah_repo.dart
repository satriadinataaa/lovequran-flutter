import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lovelyquran/models/surah_model.dart';

class SurahRepo {
  Future<List<Surah>> getData() async {
    const _baseUrl = 'https://api-quran-flutter.herokuapp.com/surah';

    List<Surah> surah = [];

    try {
      final response = await http.get(Uri.parse(_baseUrl));
      var rp = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Iterable it = rp['data'];
        return it.map((e) => Surah.fromJson(e)).toList();
      }

      return surah;
    } catch (e) {
      throw Exception('Failed to load album');
    }
  }

  // Future getSurahDetail(int sequence) async {
  //   var _baseUrl =
  //       'https://api-quran-flutter.herokuapp.com/surah/' + sequence.toString();

  //   late Surah surahData;
  //   try {
  //     final response = await http.get(Uri.parse(_baseUrl));
  //     var rp = jsonDecode(response.body);
  //     // print(rp.runtimeType);
  //     if (response.statusCode == 200) {
  //       // print(rp['data']['ayahs']);
  //       surahData = Surah(
  //           arabName: rp['data']['name']['long'],
  //           idName: rp['data']['name']['transliteration']['id'],
  //           number: rp['data']['number'],
  //           url:
  //               'https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/' +
  //                   rp['data']['number'].toString().padLeft(3, '0') +
  //                   '.mp3',
  //           sequence: rp['data']['sequence'],
  //           asal: rp['data']['revelation']['id'],
  //           ayat: rp['data']['numberOfVerses']);

  //       for (var i = 0; i < rp['data']['verses'].length; i++) {
  //         var ayats = Ayat(
  //           ayatSurah: rp['data']['verses'][i]['number']['inSurah'],
  //           textArab: rp['data']['verses'][i]['text']['arab'],
  //           textIndo: rp['data']['verses'][i]['text']['transliteration']['en'],
  //           textTrans: rp['data']['verses'][i]['translation']['id'],
  //         );
  //         surahData.ayatList.add(ayats);
  //       }
  //     }
  //     // print(surahData.ayatList[0]);
  //     return surahData;
  //   } catch (e) {
  //     throw Exception('Failed to load album');
  //   }
  // }
}
