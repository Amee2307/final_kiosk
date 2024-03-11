import 'dart:async';

import 'package:final_kiosk/home_page.dart';
import 'package:final_kiosk/utils/app_images.dart';
import 'package:final_kiosk/utils/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 20), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.logo,
                height: 200,
                width: 200,
              ),

              // Text(
              //   'Tap To Taste',
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // ),
              Image.asset(
                AppImages.splash,
                height: 300,
                width: 300,
              ),

              SizedBox(
                height: 50,
                width: 243,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      foregroundColor: AppColors.white,
                      backgroundColor: AppColors.svgbg,

                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => MyHomePage()));
                    },
                    child: Text(
                      'Get Started>>',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,
                      color: Colors.black
                      ),
                    )),
              ),
              SizedBox(height: 133,),
              Image.asset('assets/images/Waves.png',
                height: 80,
                width: 393,
              )

              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(5),
              //     color: AppColors.green,
              //   ),
              //   child: Text('Get Started>>',
              //   style: TextStyle(
              //       fontSize: 18,
              //       fontWeight: FontWeight.w600,
              //       color: Colors.white
              //   ),),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
