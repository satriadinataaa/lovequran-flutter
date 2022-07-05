import 'package:flutter/material.dart';
import 'package:lovelyquran/models/surah.dart';
import 'package:lovelyquran/util/colors.dart';
import '../repositories/surah_repo.dart';

class DetailSurahPage extends StatefulWidget {
  final int number;

  const DetailSurahPage({Key? key, required this.number}) : super(key: key);

  @override
  State<DetailSurahPage> createState() => _DetailSurahPageState();
}

class _DetailSurahPageState extends State<DetailSurahPage> {
  SurahRepo surahRepo = SurahRepo();
  Surah mySurah = Surah();
  fetchData(seq) async {
    mySurah = await surahRepo.getSurahDetail(seq);
    setState(() {});
  }

  @override
  void initState() {
    fetchData(widget.number);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                mySurah.idName,
                style: TextStyle(
                    color: orangeColor,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                    fontSize: 32),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  mySurah.asal,
                  style: TextStyle(
                      color: darkGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                )),
          ],
        ),
      ),
    ));
  }
}
