import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scroll_navigation/scroll_navigation.dart';

import '../../../../theme.dart';
import '../controllers/my_orders_controller.dart';

class MyOrdersView extends GetView<MyOrdersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: primaryColor,
        ),
        title: Text(
          "My Orders",
          style: ProductNameStyle.copyWith(fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: Screen(

          controllerToHideAppBar: controller.scrollC,
          body: TitleScrollNavigation(

            barStyle: TitleNavigationBarStyle(
              style: labelStyle,
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              spaceBetween: 40,

              activeColor: Colors.orange,
            ),
            titles: [
              "Not yet paid",
              "Packing",
              "Sent",
              "Done",
              "Cancel",
            ],
            pages: [
              ListView.builder(
                itemCount: 30,
                controller: controller.scrollC,
                padding: EdgeInsets.zero,
                itemBuilder: (_, __) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: 60,
                      color: Colors.blue[50],
                    ),
                  );
                },
              ),
              Container(color: Colors.red[50]),
              Container(color: Colors.green[50]),
              Container(color: Colors.purple[50]),
              Container(color: Colors.yellow[50]),
            ],
          ),
        ),
      ),
    );
  }
}
