import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lovelyquran/pages/detail_surah.dart';
import '../repositories/surah_repo.dart';
import '../util/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/surah.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List listSurah = [];
  SurahRepo surahRepo = SurahRepo();

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    final counter = prefs.getString('surah') ?? 0;
    if (counter == 0) {
      listSurah = await surahRepo.getData();
      await prefs.setString('surah', jsonEncode(listSurah));
    } else {
      var surah = counter;
      late var daftarSurah = [];
      var decodedList = json.decode(surah.toString());
      late Surah s;
      // listSurah = await surahRepo.decodedSurah(decodedList);
      for (var i = 0; i < decodedList.length; i++) {
        s = Surah(
          number: decodedList[i]['number'],
          sequence: decodedList[i]['sequence'],
          arabName: decodedList[i]['arabName'],
          idName: decodedList[i]['idName'],
          asal: decodedList[i]['asal'],
          ayat: decodedList[i]['ayat'],
        );
        daftarSurah.add(s);
      }
      listSurah = daftarSurah;
    }
    setState(() {});
  }

  checkLocal() async {}
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            Expanded(
              flex: 1,
              child: Container(
                color: lowOrangeColor,
                child: ListView.separated(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailSurahPage(
                                      number: listSurah[index].number)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 20, right: 20),
                          child: Row(
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                    color: orangeColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      // bottomLeft: Radius.circular(10),
                                      // bottomRight: Radius.circular(10)
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    listSurah[index].number.toString(),
                                    style: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      listSurah[index].idName,
                                      textAlign: TextAlign.left,
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Text(
                                        listSurah[index].asal,
                                        textAlign: TextAlign.left,
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: darkGrey),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      listSurah[index].arabName,
                                      textAlign: TextAlign.left,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 30,
                                          color: Colors.black87),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                      // child: Text(listSurah[index]['number'].toString()));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                    itemCount: listSurah.length),
              ),
            )
          ])),
    ));
  }
}
