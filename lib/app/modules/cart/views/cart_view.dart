import 'package:e_comerce_shoes/app/controllers/umum_controller.dart';
import 'package:e_comerce_shoes/theme.dart';
import 'package:e_comerce_shoes/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  final umumC = Get.find<UmumController>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              pinned: true,
              backgroundColor: Colors.white,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: primaryColor,
                ),
              ),
              flexibleSpace: Container(
                child: Center(
                  child: Text(
                    "Your Cart",
                    style: ProductNameStyle.copyWith(fontSize: 18),
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.only(top: 5, right: 30, left: 30),
                child: StreamBuilder<void>(
                    stream: umumC.getCartStream(),
                    builder: (context, snapshot) {
                      return Column(
                        children: [
                          ...umumC.listCart.map((element) {
                            return ListItem(
                              isCart: true,
                              cart: element,
                            );
                          }).toList()
                        ],
                      );
                    }),
              )
            ]))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white),
        width: double.infinity,
        height: 160,
        child: Column(
          children: [
            SizedBox(
              height: 17,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal",
                        style: ProductNameStyle.copyWith(fontSize: 16),
                      ),
                      Obx(() => Text(
                        "Rp. ${umumC.subtotal.value}",
                        style: labelStyle.copyWith(
                          fontSize: 16,
                          color: primaryColor,
                        ),
                      ),)
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Jumlah Item :",
                        style: subTitleStyle.copyWith(fontSize: 12),
                      ),
                      Obx(() =>  Text(
                        "x${umumC.jumitem}",
                        style: labelStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),)
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey[350],
                  ),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.CHECKOUT);
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(58, 0, 58, 20),
                child: Container(
                  height: 47,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: primaryColor),
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Continue to checkout",
                      style: ProductNameStyle.copyWith(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
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
