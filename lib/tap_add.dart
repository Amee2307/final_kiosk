import 'dart:convert';
import 'package:final_kiosk/utils/colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:final_kiosk/menu_model_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TapAdd extends StatefulWidget {
  final MenuClass? menuClass;

  TapAdd({this.menuClass});

  @override
  State<TapAdd> createState() => _TapAddState();
}

class _TapAddState extends State<TapAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                widget.menuClass!.productimage.toString(),
                width: 500,
                height: 250,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Divider(
            //   color: Colors.black,
            //   thickness: 0.8,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 100,
                width: 500,
                decoration: BoxDecoration(
                  color: AppColors.checkoutbg,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '₹${widget.menuClass!.productprice.toString()}',
                        style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.menuClass!.productname.toString(),
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),

                    ],
                  ),
                ),
              ),
            ),
           
         
            Padding(
              padding: const EdgeInsets.only(left: 70,top: 40) ,
              child: Container(
                height: 300,
                width: 320,
                decoration: BoxDecoration(
                    color: AppColors.checkoutbg,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                    ),
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Product Description :",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                          height:12
                      ),
                      Text('${widget.menuClass!.productdesc}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Divider(
                        color: AppColors.checkoutbg,
                        thickness: 8,
                      ),



                    ],
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
