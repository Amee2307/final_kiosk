import 'package:final_kiosk/home_page.dart';
import 'package:final_kiosk/splash_screen.dart';
import 'package:final_kiosk/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Mo",

      // colorScheme: ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
