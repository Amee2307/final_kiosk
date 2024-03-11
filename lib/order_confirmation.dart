import 'package:final_kiosk/menu_screen.dart';
import 'package:final_kiosk/utils/app_images.dart';
import 'package:final_kiosk/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderConfirm extends StatefulWidget {
  const OrderConfirm({super.key});

  @override
  State<OrderConfirm> createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 150,left:25,right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.orderconfirm,
               height: 290 ,
              width: 260 ,
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Your Order Is Confirmed',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),
                ),
                SizedBox(width: 2,),
                Icon(Icons.verified,
                weight: 10,
                  color: Colors.lightBlue,
                ),
              ],
            ),
           SizedBox(height: 5,),
            Text('Order Type: Take Away',
              style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 5,),
            Text('Order Number: #452367 ',
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
            ),
           SizedBox(height: 30,),
        Container(
          decoration: BoxDecoration(
              border: BorderDirectional(
                  bottom: BorderSide(color: AppColors.white))),

           child:  InkWell(
             splashColor: Colors.blue,
             // focusColor: Colors.blue,
             onTap: () {


               },
             child: Text('Click Here to Download Order Receipt',
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),
              ),
           ),),
            SizedBox(height: 120,),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context)=> MenuScreen()),
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
                      'Done',
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
      )
    );
  }
}
