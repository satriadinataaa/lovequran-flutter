import 'package:flutter/material.dart';
import 'package:lovelyquran/viewModel/surah/surah_view_model.dart';
import 'package:lovelyquran/util/colors.dart';

class ListSurah extends StatelessWidget {
  final List<SurahViewModel> listSurah;
  const ListSurah({Key? key, required this.listSurah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lowOrangeColor,
      child: ListView.separated(
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            if (listSurah.isEmpty) {
              return CircularProgressIndicator();
            } else {
              return TextButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => DetailSurahPage(
                  //             number: listSurah[index].number)));
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
                              listSurah[index].idName.toString(),
                              textAlign: TextAlign.left,
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(
                                listSurah[index].asal.toString(),
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
                              listSurah[index].arabName.toString(),
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
            }
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemCount: listSurah.length),
    );
  }
}
