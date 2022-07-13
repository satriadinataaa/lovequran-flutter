import 'package:flutter/material.dart';
import 'package:lovelyquran/models/surah.dart';
import '../repositories/surah_repo.dart';
import '../util/colors.dart';
import 'package:audioplayers/audioplayers.dart';

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
    // setState(() {});
  }

  play() async {
    AudioPlayer player = AudioPlayer();
    int result = await player.play(mySurah.url);
    if (result == 1) {
      // success
    }
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
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
          child: FutureBuilder(
            future: fetchData(widget.number),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
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
                        SizedBox(height: 5),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              mySurah.asal,
                              style: TextStyle(
                                  color: darkGrey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            )),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  mySurah.ayat.toString() + ' Ayat',
                                  style: TextStyle(
                                      color: orangeColor,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w800),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: orangeColor),
                                onPressed: () {
                                  play();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: Text(
                                    'Dengarkan sekarang',
                                    style:
                                        TextStyle(fontSize: 20, color: white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: double.infinity,
                          child: ListView.separated(
                              physics: AlwaysScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return DecoratedBox(
                                    decoration: BoxDecoration(
                                        color: ayatBg,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(8.0),
                                            bottomLeft: Radius.circular(8.0))),
                                    child: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Column(
                                          children: [
                                            Align(
                                                alignment: Alignment.topRight,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    mySurah.ayatList[index]
                                                        .textArab,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    style: TextStyle(
                                                        fontSize: 36,
                                                        letterSpacing: 2,
                                                        height: 1.5),
                                                  ),
                                                )),
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    mySurah.ayatList[index]
                                                            .ayatSurah
                                                            .toString() +
                                                        '. ' +
                                                        mySurah.ayatList[index]
                                                            .textTrans,
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      height: 1.5,
                                                    ),
                                                  ),
                                                ))
                                          ],
                                        )));
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 15,
                                );
                              },
                              itemCount: mySurah.ayat),
                        ))
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    ));
  }
}
