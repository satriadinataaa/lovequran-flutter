import 'package:flutter/material.dart';
import './pages/splash.dart';
import './pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Named Routes Demo',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),

        // When navigating to the "/second" route, build the SecondScreen widget.
        // '/second': (context) => const SecondScreen(),
      },
    );
  }
}
