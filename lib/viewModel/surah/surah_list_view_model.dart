import 'package:flutter/material.dart';
import 'package:lovelyquran/services/surah_repo.dart';
import './surah_view_model.dart';

class SurahListViewModel extends ChangeNotifier {
  List<SurahViewModel> surahs = <SurahViewModel>[];

  Future<void> fetchData() async {
    final res = await SurahRepo().getData();
    surahs = res.map((e) => SurahViewModel(surah: e)).toList();
    notifyListeners();
  }
}
