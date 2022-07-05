import 'package:flutter/material.dart';
import '../util/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: bgColor,
          child: ListView(
            children: [
              Column(
                children: [
                  Image.asset('assets/bacakoran.png'),
                  const Padding(padding: EdgeInsets.all(50)),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 50),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style:
                            TextButton.styleFrom(backgroundColor: orangeColor),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Mulai Sekarang',
                            style: TextStyle(fontSize: 20, color: white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
