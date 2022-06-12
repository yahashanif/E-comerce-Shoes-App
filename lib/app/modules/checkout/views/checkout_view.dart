import 'package:e_comerce_shoes/app/controllers/ongkir_controller.dart';
import 'package:e_comerce_shoes/app/controllers/umum_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../theme.dart';
import '../../../../widgets/widgets.dart';
import '../../../routes/app_pages.dart';
import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  final umumC = Get.find<UmumController>();
  final ongkirC = Get.find<OngkirController>();
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
                  child: Obx(
                    () => Column(
                      children: [
                        ...umumC.listCart
                            .map(
                              (element) => ListItem(
                                isCart: true,
                                isCheckout: true,
                                cart: element,
                              ),
                            )
                            .toList()
                      ],
                    ),
                  ),
                )
              ]))
            ],
          ),
        ),
        bottomNavigationBar: Obx(() {
          if (ongkirC.listOngkir.length == 0) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white),
              width: double.infinity,
              height: controller.viewAddress.value ? 450 : 350,
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
                              onTap: () {
                                controller.viewAddress.value =
                                    !controller.viewAddress.value;
                              },
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: primaryColor,
                              ),
                            )
                          ],
                        ),
                        controller.viewAddress.value
                            ? Container(
                                height: 100,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(color: greyColor),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                    child: Text(
                                        "${umumC.province.value},${umumC.district},${umumC.subDistrict}")),
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: Colors.green.withOpacity(0.5)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Opsi Pengiriman",
                                  style: subTitleStyle,
                                ),
                              ),
                              Container(
                                height: 2,
                                color: Colors.green.withOpacity(0.2),
                                width: double.infinity,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.LIST_KURIR);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${ongkirC.ongkirPilih.value.name} - ${ongkirC.ongkirPilih.value.cost!.service!}",
                                        style:
                                            labelStyle.copyWith(fontSize: 12),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Akan diterima dalam " +
                                                  ongkirC
                                                      .listOngkir
                                                      .first
                                                      .costs!
                                                      .first
                                                      .cost!
                                                      .first
                                                      .etd! +
                                                  " hari",
                                              style: labelStyle.copyWith(
                                                  fontSize: 12,
                                                  color: primaryColor),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Rp. ${ongkirC.ongkirPilih.value.cost!.cost!.first.value.toString()}",
                                                  style: labelStyle.copyWith(
                                                      fontSize: 14),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  size: 15,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
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
                              "${umumC.jumitem} Items",
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
                              "Rp. ${umumC.subtotal}",
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
                              "Rp. ${ongkirC.ongkirPilih.value.cost!.cost!.first.value}",
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
                              "Total",
                              style: ProductCategoryStyle.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w100),
                            ),
                            Text(
                              "Rp. ${ongkirC.ongkirPilih.value.cost!.cost!.first.value! + umumC.subtotal.toInt()}",
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
            );
          }
        }));
  }
}
