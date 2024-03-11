import 'dart:convert';

import 'package:final_kiosk/check_out_screen.dart';
import 'package:final_kiosk/menu_model_class.dart';
import 'package:final_kiosk/utils/app_images.dart';
import 'package:final_kiosk/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'cat_model_class.dart';
import 'tap_add.dart';
import 'utils/api_url.dart';

class MenuScreen extends StatefulWidget {
  String? catId;

  MenuScreen({this.catId});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // List<MenuClass> cart = [];

   int itemCount=1;
  SharedPreferences? prefs;
  List<MenuClass> addItem = [];

  List<CatClass> users = [];
  List<MenuClass> item = [];

  void getCartList() async {
    prefs = await SharedPreferences.getInstance();
    var cartData = prefs!.getString('cartItem');
    if (cartData != null) {
      var data = jsonDecode(cartData);
      addItem = (data as List).map((e) => MenuClass.fromJson(e)).toList();
      setState(() {});
    }
  }

  void fetchCategoryUser() async {
    final response = await http.get(Uri.parse(ApiUrl.categoryUrl));
    //waiting for the response
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      users = (data).map((e) => CatClass.fromJson(e)).toList();
      print('CATEGORY RESPONSE________${response.body}');
    }
    setState(() {});
  }

  void fetchMenuItems() async {
    final response = await http.post(Uri.parse(ApiUrl.menuUrl),
        body: jsonEncode({
          'cat_id': widget.catId.toString(),
        }),
        headers: {'Content-Type': 'application/json'});
    //waiting for the response
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      item = (data['data'] as List).map((e) => MenuClass.fromJson(e)).toList();
      print('MENU RESPONSE____________${response.body}');

      setState(() {});
    }
  }

  // void addtocart(String item) {
  //   if (cart.contains(item)) {
  //     setState(() {
  //       cart.add(item as MenuClass);
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    fetchCategoryUser();
    fetchMenuItems();
    getCartList();
    addItem.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.svgbg,
                    ),
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final d = users[index];
                        final img = d.imgurl;

                        return Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MenuScreen(
                                          catId: d.categoryId.toString(),
                                          // menuClass: item[index],
                                        ),
                                      ));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(img.toString(),
                                      height: 70, width: 70),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                d.categoryName.toString(),
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: users.length,
                    ),
                  ),
                ),





                Expanded(
                  flex: 3,
                  // child: SelectItem(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // crossAxisSpacing: 2,
                        // mainAxisSpacing: 5,
                        childAspectRatio: 0.7,
                      ),
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final m = item[index];
                        final img1 = m.productimage;

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => TapAdd(
                                              menuClass: item[index],
                                            ),
                                          ));
                                    },
                                    child: Container(
                                      height: 120,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                blurRadius: 2,
                                                spreadRadius: 3,
                                                offset: Offset(0, 3)),
                                          ]),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.network(
                                          img1.toString(),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    right: 10,
                                    child: GestureDetector(
                                      onTap: () async {

                                        if (item[index].useSelctedItem == false)
                                        {
                                          item[index].useSelctedItem = true;
                                          setState(() {
                                            addItem.add(
                                              MenuClass(
                                                 totalsum: 0,
                                                itemCount: itemCount,
                                                  productname: item[index]
                                                      .productname
                                                      .toString(),
                                                  productimage:
                                                      item[index].productimage,
                                                  productprice:
                                                      item[index].productprice,
                                                  productid:
                                                      item[index].productid),

                                            );
                                          });
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'Already added item')));
                                          return null;
                                        }

                                        print('object');
                                        await prefs!.setString(
                                            'cartItem', jsonEncode(addItem));
                                        setState(() {});
                                        // print('________________${prefs}');
                                        print(
                                            'ADDED ITEMS::::::${jsonEncode(addItem)}');
                                      },
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.yellow),
                                        child: Icon(
                                          Icons.add,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                m.productname.toString(),
                                textAlign: TextAlign.center,
                                // overflow: TextOverflow.clip,
                                // maxLines: 1,
                                style: TextStyle(
                                    fontSize: 12,
                                    height: 1.2,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                '₹${m.productprice.toString()}',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: item.length,
                    ),
                  ),
                ),
              ]),
            ),
          ]),
      floatingActionButton: Badge(
        label: Text(
          addItem.length.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        textColor: Colors.deepOrange,
        offset: const Offset(-20, 27),
        child: FloatingActionButton(
          backgroundColor: AppColors.svgbg,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckOutScreen(
                    menuItem: addItem,
                  ),
                ));
            // addtocart('item ${cart.length + 1}');
          },
          child: Image.asset(
            AppImages.icon,
            width: 35,
            height: 35,
          ),
        ),
      ),
    );
  }
}
