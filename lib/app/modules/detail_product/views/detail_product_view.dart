import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comerce_shoes/app/controllers/umum_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../theme.dart';
import '../../../routes/app_pages.dart';
import '../controllers/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    Widget _detail_caraousel() {
      return Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height / 2,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: true,
            ),
            items: controller.umumc.listProductImage.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        image: DecorationImage(
                            image: NetworkImage(
                                baseUrl + "product/image/" + i.urlImage!),
                            fit: BoxFit.cover)),
                  );
                },
              );
            }).toList(),
          ),
          SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white)),
                      child: Icon(
                        Icons.arrow_back_ios_sharp,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white)),
                    child: Icon(
                      Icons.favorite_outline_sharp,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    Widget _content() {
      return Container(
        margin:
            EdgeInsets.only(top: MediaQuery.of(context).size.height / 2 - 50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.transparent),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 34, vertical: 21),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.umumc.product.value.name!,
                          style: ProductNameStyle.copyWith(fontSize: 18.sp),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.umumc.product.value.category!.category
                                  .toString(),
                              style:
                                  ProductCategoryStyle.copyWith(fontSize: 14),
                            ),
                            Text(
                              "Rp. ${controller.umumc.product.value.harga}",
                              style: labelStyle.copyWith(fontSize: 18),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              "Size",
                              style: ProductNameStyle.copyWith(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            )),
                        Expanded(
                          flex: 4,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...controller.umumc.listProductsDetail
                                    .map(
                                      (element) => GestureDetector(
                                        onTap: () {
                                          controller.id_product_detail.value !=
                                                  element.id.toString()
                                              ? controller.id_product_detail
                                                  .value = element.id.toString()
                                              : controller
                                                  .id_product_detail.value = "";
                                        },
                                        child: Obx(
                                          () => Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 6),
                                            height: 32,
                                            width: 27,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: controller
                                                            .id_product_detail
                                                            .value ==
                                                        element.id.toString()
                                                    ? primaryColor
                                                    : Colors.grey),
                                            child: Center(
                                              child: Text(
                                                element.size.toString(),
                                                style:
                                                    ProductNameStyle.copyWith(
                                                        fontSize: 10,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList()
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Description",
                      style: ProductNameStyle.copyWith(fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      controller.umumc.product.value.description!,
                      style: ProductNameStyle.copyWith(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w100),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _detail_caraousel(),
          _content(),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
        height: 75,
        child: Row(
          children: [
            Container(
              height: 47,
              width: 59,
              decoration: BoxDecoration(
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Image.asset("assets/icons/chat_active.png"),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                controller.umumc
                    .AddCart(controller.id_product_detail.value, "1");
              },
              child: Container(
                height: 47,
                width: MediaQuery.of(context).size.width - (48 + 59 + 10),
                decoration: BoxDecoration(
                    border: Border.all(color: primaryColor),
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Add to cart",
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
    );
  }
}
