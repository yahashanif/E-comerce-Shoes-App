import 'package:e_comerce_shoes/app/controllers/umum_controller.dart';
import 'package:e_comerce_shoes/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scroll_navigation/scroll_navigation.dart';

import '../../../../theme.dart';
import '../controllers/my_orders_controller.dart';

class MyOrdersView extends GetView<MyOrdersController> {
  final umumC = Get.find<UmumController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: primaryColor,
            ),
          ),
          title: Text(
            "My Orders",
            style: ProductNameStyle.copyWith(fontSize: 18),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              flexibleSpace: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                    child: Stack(children: [
                  Container(
                    margin: EdgeInsets.only(top: 48),
                    height: 1,
                    color: primaryColor,
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: Obx(
                            () => Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    umumC.Navbar.value = 0;
                                  },
                                  child: Text(
                                    "Not yet paid",
                                    style: ProductNameStyle.copyWith(
                                        fontSize: 12,
                                        color: umumC.Navbar.value != 0
                                            ? greyColor
                                            : Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 3,
                                  margin: EdgeInsets.only(top: 13),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1.5),
                                      color:  umumC.Navbar.value == 0
                                            ? primaryColor
                                            : Colors.transparent,),
                                )
                              ],
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: Obx(
                            () => Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    umumC.Navbar.value = 1;
                                  },
                                  child: Text(
                                    "Packing",
                                    style: ProductNameStyle.copyWith(
                                        fontSize: 12,
                                        color: umumC.Navbar.value != 1
                                            ? greyColor
                                            : Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 3,
                                  margin: EdgeInsets.only(top: 13),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1.5),
                                      color:umumC.Navbar.value == 1
                                            ? primaryColor
                                            : Colors.transparent,),
                                )
                              ],
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: Obx(
                            () => Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    umumC.Navbar.value = 2;
                                  },
                                  child: Text(
                                    "Sent",
                                    style: ProductNameStyle.copyWith(
                                        fontSize: 12,
                                        color: umumC.Navbar.value != 2
                                            ? greyColor
                                            : Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 3,
                                  margin: EdgeInsets.only(top: 13),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1.5),
                                      color: umumC.Navbar.value == 2
                                            ? primaryColor
                                            : Colors.transparent,),
                                )
                              ],
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: Obx(
                            () => Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    umumC.Navbar.value = 3;
                                  },
                                  child: Text(
                                    "Done",
                                    style: ProductNameStyle.copyWith(
                                        fontSize: 12,
                                        color: umumC.Navbar.value != 3
                                            ? greyColor
                                            : Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 3,
                                  margin: EdgeInsets.only(top: 13),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1.5),
                                      color: umumC.Navbar.value == 3
                                            ? primaryColor
                                            : Colors.transparent,),
                                )
                              ],
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: Obx(
                            () => Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    umumC.Navbar.value = 4;
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: ProductNameStyle.copyWith(
                                        fontSize: 12,
                                        color: umumC.Navbar.value != 4
                                            ? greyColor
                                            : Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 3,
                                  margin: EdgeInsets.only(top: 13),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1.5),
                                      color: umumC.Navbar.value == 4
                                            ? primaryColor
                                            : Colors.transparent,),
                                )
                              ],
                            ),
                          )),
                    ],
                  )
                ])),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Obx(
                () => umumC.Navbar.value == 0
                    ? _notYetPaid()
                    : umumC.Navbar.value == 1
                        ? _packing()
                        : umumC.Navbar.value == 2
                            ? _sent()
                            : umumC.Navbar.value == 3
                                ? _done()
                                : _cancel()
              )
            ]))
          ],
        ));
  }
  Widget _notYetPaid(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 25),
      child: Column(
        children: [
         CardItemMyOrders()
        ],
      ),
    );
  }
  Widget _packing(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 25),
      child: Column(
        children: [
         CardItemMyOrders(isPay: true,)
        ],
      ),
    );
  }
  Widget _sent(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 25),
      child: Column(
        children: [
         CardItemMyOrders(isPay: true,)
        ],
      ),
    );
  }
  Widget _done(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 25),
      child: Column(
        children: [
         CardItemMyOrders(isPay: true,)
        ],
      ),
    );
  }
  Widget _cancel(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 25),
      child: Column(
        children: [
         CardItemMyOrders(isPay: true,)
        ],
      ),
    );
  }
}
