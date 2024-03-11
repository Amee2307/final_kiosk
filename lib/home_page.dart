import 'package:final_kiosk/menu_screen.dart';
import 'package:final_kiosk/utils/app_images.dart';
import 'package:final_kiosk/utils/colors.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 225),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Where will you be',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            Text(
              'eating today?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 140,
                  height: 180,
                  // color: AppColors.primary,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AppImages.eatin,
                        height: 130,
                        width: 160,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            foregroundColor: AppColors.white,
                            backgroundColor: AppColors.svgbg,
                          // backgroundColor:Colors.red.withOpacity(0.6)
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuScreen()));
                          },
                          child: Text('Eat In',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600,
                              color: Colors.black
                              ))),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: 140,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AppImages.takeaway,
                        height: 130,
                        width: 160,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            foregroundColor: AppColors.white,
                            backgroundColor: AppColors.svgbg,
                            //   backgroundColor: Colors.red.withOpacity(0.6)
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuScreen()));
                          },
                          child: Text(
                            'Take Away',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600,color: Colors.black),
                          )),

                    ],
                  ),
                ),
              ],
            ),
             SizedBox(height: 190,),
            Image.asset('assets/images/Waves.png',
              height: 80,
              width: 393,
            )
          ],
        ),
      ),
    );
  }
}
