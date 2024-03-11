import 'package:final_kiosk/order_confirmation.dart';
import 'package:final_kiosk/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'utils/colors.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(AppImages.payment,
                   height: 290,
                   width: 260,

              ),
            ),
             SizedBox(height: 30,),
            Text('Scan This QR Code To Payment ',
              style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black
              ),
            ),
            SizedBox(height:15,),
           Image.asset(AppImages.scanner,
             height: 100,
             width: 100,
           ),
            SizedBox(height: 15,),
            Text('OR',  style: TextStyle(
                fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black
            ),),
            SizedBox(height: 15,),


            Container(
              height: 100,
              width: 100,
              color: AppColors.svgbg,
              child: Center(
                child: Image.asset('assets/images/svgcard.png',
                  width: 65,
                  height: 65,
                ),
              ),
            ),

            // Image.asset(AppImages.card,
            //  height: 100,
            //  width: 100,
           // ),
            SizedBox(height: 5,),
            Text('Pay using card',),

            SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context)=> OrderConfirm()),
                );
              },

              child: Container(
                height: 50,
                width: 300,
                // margin: EdgeInsets.only(top: 180,left: 15,right: 15,bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.svgbg,

                ),
                child: Center(
                  child: Text(
                      'PAY ₹410',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
