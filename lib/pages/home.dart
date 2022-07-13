import 'package:flutter/material.dart';
import 'package:lovelyquran/viewModel/surah/surah_list_view_model.dart';
import 'package:lovelyquran/widgets/list_surah.dart';
import 'package:provider/provider.dart';
import '../services/surah_repo.dart';
import '../util/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SurahRepo surahRepo = SurahRepo();

  fetchSurah(daftarSurah) {
    if (daftarSurah.isEmpty) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListSurah(listSurah: daftarSurah);
    }
  }

  getData() {
    Provider.of<SurahListViewModel>(context, listen: false).fetchData();
  }

  checkLocal() async {}
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final daftarSurah = Provider.of<SurahListViewModel>(context);
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
          // child:
          child: Column(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hai, Apa kabar?',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: orangeColor),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            SizedBox(
              width: double.infinity,
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: orangeColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0))),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Daftar Surah',
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  )),
            ),
            Expanded(flex: 1, child: fetchSurah(daftarSurah.surahs))
          ])),
    ));
  }
}
