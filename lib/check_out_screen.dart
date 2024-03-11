import 'package:final_kiosk/menu_model_class.dart';
import 'package:final_kiosk/menu_screen.dart';
import 'package:final_kiosk/scanner_screen.dart';

import 'package:final_kiosk/utils/colors.dart';
import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckOutScreen extends StatefulWidget {
  List<MenuClass> menuItem = [];

  CheckOutScreen({
    required this.menuItem,
    // required this.text,
    //   required this.value,
  });

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {


  //for total

  double taxRate = 0;
  double subtotal= 20;

  // Calculate subtotal

  // Calculate tax amount
  calculateTax() {
    return subtotal + taxRate;
  }

  // Calculate total price
  calculateTotal() {
    return  calculateTax();
  }

  late int count;


  // List<SubmitMenu> amount= [];

  //for item delete from cart function
  void removeItem(int index) {
    widget.menuItem.removeAt(index);
    print('DELETED::::::');

    setState(() {});
  }

  //  totalprice() async {
  //   var body={
  //     {
  //       "total": 120200.50,
  //       "tax":20,
  //       "products": [
  //         {
  //           "menu_id": "35",
  //           "qty": 2,
  //           "sub_total": 50.25
  //         },
  //         {
  //           "menu_id": "34",
  //           "qty": 1,
  //           "sub_total": 100.25
  //         }
  //       ]
  //     }
  //   };
  //   final response = await http.post(Uri.parse(ApiUrl.totalUrl),
  //       body: jsonEncode(body),
  //       headers: {'Content-Type': 'application/json'});
  //   //waiting for the response
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //
  //     amount = (data['data'] as List).map((e) => SubmitMenu.fromJson(e)).toList();
  //
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Check Out",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MenuScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Cancel Order',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.red,
                      decorationThickness: 2.5),
                ),
              ),
            ),
          ]),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                int sum = widget.menuItem[index].itemCount *
                    int.parse(widget.menuItem[index].productprice.toString());

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: Container(
                    height: 90,
                    // width: 343,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.checkoutbg),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            removeItem(index);
                          },
                          child: Icon(
                            Icons.delete_outline_rounded,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: Image.network(
                            widget.menuItem[index].productimage.toString(),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.menuItem[index].productname.toString(),
                              style: TextStyle(fontSize: 13),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.menuItem[index].itemCount++;

                                      print('Sum:::$sum');

                                      print(
                                          'ITEM COUNT::::${widget.menuItem[index].itemCount}');
                                    });
                                    /*     print('TOTAALCOUNT PRICE:::::${price},');
                                    print('TOTAALCOUNT PRICE:::::${price},');*/
                                  },
                                  child: AnimatedSwitcher(
                                    duration: Duration(milliseconds: 500),
                                    transitionBuilder: (Widget child,
                                        Animation<double> animation) {
                                      return ScaleTransition(
                                          scale: animation, child: child);
                                    },
                                    child: Image.asset(
                                      'assets/images/plusss.png',
                                      height: 18,
                                      width: 18,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                AnimatedSwitcher(
                                  duration: Duration(milliseconds: 50),
                                  transitionBuilder: (Widget child,
                                      Animation<double> animation) {
                                    return ScaleTransition(
                                        scale: animation, child: child);
                                  },
                                  child: Text(
                                    '${widget.menuItem[index].itemCount}',
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (widget.menuItem[index].itemCount == 1) {
                                      return null;
                                    }
                                    setState(() {
                                      widget.menuItem[index].itemCount--;
                                      sum = widget.menuItem[index].itemCount *
                                          int.parse(widget
                                              .menuItem[index].productprice
                                              .toString());
                                      print(
                                          'ITEM COUNT::::${widget.menuItem[index].itemCount}');
                                      print('Sum:::$sum');
                                    });
                                  },
                                  child: Image.asset(
                                    'assets/images/minus.png',
                                    height: 18,
                                    width: 18,
                                  ),
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                Text(
                                  '₹${sum}',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                displayBottomSheet(context);
                              },
                              child: Text(
                                'Add ons',
                                style: TextStyle(
                                    fontSize: 15,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.black,
                                    decorationThickness: 1.5),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: widget.menuItem.length,
            ),
          ),

          GestureDetector(
            onTap: () {
              paymentBottomSheet(context);
            },
            child: Container(
              height: 50,
              width: 323,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.svgbg),
              child: Center(
                child: Text(
                  'Proceed To Payment ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          // Container(
          //   height: 240,
          //   width: 343,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       color: AppColors.checkoutbg),
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 20, right: 20),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.stretch,
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         Text(
          //           'Payment Details :',
          //           style: TextStyle(fontSize: 18),
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               'Sub total :',
          //               style: TextStyle(fontSize: 18),
          //             ),
          //             Text(
          //               '₹390',
          //               style: TextStyle(fontSize: 18),
          //             ),
          //           ],
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               'Tax :',
          //               style: TextStyle(fontSize: 18),
          //             ),
          //             Text(
          //               '₹20',
          //               style: TextStyle(fontSize: 18),
          //             ),
          //           ],
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               'Total :',
          //               style: TextStyle(fontSize: 18),
          //             ),
          //             Text(
          //               '₹410',
          //               style: TextStyle(fontSize: 18),
          //             ),
          //           ],
          //         ),
          //         GestureDetector(
          //           onTap: () {
          //             // totalprice();
          //           },
          //           child: Container(
          //             height: 50,
          //             width: 323,
          //             // padding: EdgeInsets.only(right: 20,left: 20),
          //             decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(10),
          //                 color: AppColors.svgbg),
          //             child: Center(
          //               child: Text(
          //                 'Proceed To Payment ',
          //                 style: TextStyle(
          //                     fontSize: 20, fontWeight: FontWeight.bold),
          //               ),
          //             ),
          //           ),
          //         ),
          //
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  paymentBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        enableDrag: true,
        // isDismissible: true,
        showDragHandle: true,
        context: context,
        builder: (context) => Container(
              height: 240,
              width: 343,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.checkoutbg),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Payment Details :',
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sub total :',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          ' ₹${subtotal.toString()}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tax :',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          ' ₹${taxRate.toString()}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total :',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          ' ₹${calculateTotal()}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScannerScreen()));
                      },
                      child: Container(
                        //   width: 35,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.svgbg),
                        child: Center(
                            child: Text(
                          "₹ Pay ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}

Future displayBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      enableDrag: true,
      // isDismissible: true,
      showDragHandle: true,
      context: context,
      builder: (context) => Container(
            height: 250,
            width: 343,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              // color: AppColors.white
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Add ons',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 63,
                        width: 63,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.checkoutbg),
                        child: Center(
                          child: Text(
                            'Tomato',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 63,
                        width: 63,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.checkoutbg),
                        child: Center(
                          child: Text(
                            'Onion',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 63,
                        width: 63,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.checkoutbg),
                        child: Center(
                          child: Text(
                            'Olive',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 63,
                        width: 63,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.checkoutbg),
                        child: Center(
                          child: Text(
                            'Cheese',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 38,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => CheckOutScreen(MenuClass())),
                    // );
                  },
                  child: Container(
                    height: 50,
                    width: 323,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.svgbg,
                    ),
                    child: Center(
                      child: Text(
                        'Confirm',
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
          ));
}
