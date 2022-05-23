import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../theme.dart';
import '../../../../widgets/widgets.dart';
import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
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
                      "Checkout Details",
                      style: ProductNameStyle.copyWith(fontSize: 18),
                    ),
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                  margin: EdgeInsets.only(top: 5, right: 30, left: 30),
                  child: Column(
                    children: [
                      ListItem(isCart: false),
                      ListItem(isCart: false),
                      ListItem(isCart: false),
                      ListItem(isCart: false),
                    ],
                  ),
                )
              ]))
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white),
            width: double.infinity,
            height: controller.viewAddress.value ? 325 :225,
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
                            "Address details",
                            style: ProductNameStyle.copyWith(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: (){
                              controller.viewAddress.value = !controller.viewAddress.value;
                            },
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: primaryColor,
                            ),
                          )
                        ],
                      ),
                      controller.viewAddress.value ?
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                          color: greyColor

                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ) : SizedBox(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Product Quantity",
                            style: ProductCategoryStyle.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w100),
                          ),
                          Text(
                            "2 Items",
                            style: labelStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Product Price",
                            style: ProductCategoryStyle.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w100),
                          ),
                          Text(
                            "Rp. 400.000",
                            style: labelStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Shipping",
                            style: ProductCategoryStyle.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w100),
                          ),
                          Text(
                            "Rp. 24.000",
                            style: labelStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
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
                        "Checkout Now",
                        style: ProductNameStyle.copyWith(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
