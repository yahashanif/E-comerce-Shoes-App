import 'package:e_comerce_shoes/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/umum_controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final umumC = Get.find<UmumController>();

  @override
  Widget build(BuildContext context) {
    Widget _header() {
      return Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/test.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hanif Aulia Sabri",
                            style: ProductNameStyle.copyWith(fontSize: 22),
                          ),
                          Text(
                            "@hanifas",
                            style: ProductCategoryStyle.copyWith(fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/icons/exit.png",
                    width: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget _order() {
      return Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/order.png",
                      width: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "My Orders",
                      style: labelStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.MY_ORDERS);
                  },
                  child: Row(
                    children: [
                      Text(
                        "view order history",
                        style: subTitleStyle,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 8,
                        color: greyColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 17,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      umumC.Navbar.value = 0;
                      Get.toNamed(Routes.MY_ORDERS);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/icons/wallet.png",
                          width: 20,
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text(
                          "Not yet paid",
                          style: ProductCategoryStyle.copyWith(
                              fontSize: 10, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      umumC.Navbar.value = 1;
                      Get.toNamed(Routes.MY_ORDERS);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/icons/box.png",
                          width: 20,
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text("Packing",
                            style: ProductCategoryStyle.copyWith(
                                fontSize: 10, color: Colors.black)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      umumC.Navbar.value = 2;
                      Get.toNamed(Routes.MY_ORDERS);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/icons/sent.png",
                          width: 20,
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text("Sent",
                            style: ProductCategoryStyle.copyWith(
                                fontSize: 10, color: Colors.black)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      umumC.Navbar.value = 3;
                      Get.toNamed(Routes.MY_ORDERS);
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/icons/done.png",
                          width: 20,
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text("Done",
                            style: ProductCategoryStyle.copyWith(
                                fontSize: 10, color: Colors.black)),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: [
        _header(),
        SizedBox(
          height: 20,
        ),
        _order(),
        SizedBox(
          height: 15,
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 26),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.EDIT_PROFILE);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/profile_active.png",
                          height: 30,
                        ),
                        SizedBox(
                          width: 22,
                        ),
                        Text("Edit Profile")
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 8,
                      color: greyColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.EDIT_ADDRESS);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          size: 30,
                          color: primaryColor,
                        ),
                        SizedBox(
                          width: 22,
                        ),
                        Text("Address")
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 8,
                      color: greyColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.help,
                        size: 30,
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 22,
                      ),
                      Text("Help")
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 8,
                    color: greyColor,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.stars,
                        size: 30,
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 22,
                      ),
                      Text("Rate App")
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 8,
                    color: greyColor,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    )));
  }
}
