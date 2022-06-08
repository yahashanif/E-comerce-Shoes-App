import 'package:e_comerce_shoes/app/controllers/ongkir_controller.dart';
import 'package:e_comerce_shoes/app/controllers/umum_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../theme.dart';
import '../controllers/edit_address_controller.dart';

class EditAddressView extends GetView<EditAddressController> {
  final ongkirC = Get.find<OngkirController>();
  final umumC = Get.find<UmumController>();

  List<String> listprovinsi = ["Sumatera Barat", "Bandung"];
  @override
  Widget build(BuildContext context) {
    ProvinceBox(context) {
      return Scaffold(
        body: Container(
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
                  Icons.close,
                  color: primaryColor,
                ),
              ),
              flexibleSpace: Container(
                child: Center(
                  child: Text(
                    "Choise Province",
                    style: ProductNameStyle.copyWith(fontSize: 18),
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: ongkirC.getProvince(),
                builder: (context, snapshot) => Column(
                  children: [
                    ...ongkirC.listProvince.map((e) => GestureDetector(
                          onTap: () {
                            controller.province.value = e.province.toString();
                            controller.idprovince = e.provinceId.toString();
                            controller.district.value =
                                "Pilih Kabupaten / Kota Anda";
                            controller.subDistrict.value =
                                "Pilih Kecamatan Anda";
                            controller.postalCode.value = "----";
                            controller.idCity = null;
                            controller.idSubdistrict = null;
                            print(e.provinceId);
                            Get.back();
                          },
                          child: Container(
                              padding: EdgeInsets.all(10),
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Text(
                                e.province.toString(),
                                style: labelStyle,
                              )),
                        ))
                  ],
                ),
              )
            ]))
          ],
        )),
      );
    }

    districtBox(context) {
      return Scaffold(
        body: Container(
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
                  Icons.close,
                  color: primaryColor,
                ),
              ),
              flexibleSpace: Container(
                child: Center(
                  child: Text(
                    "Choise District / City",
                    style: ProductNameStyle.copyWith(fontSize: 18),
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: ongkirC.getCity(controller.idprovince!),
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        ...ongkirC.listCity.map((e) => GestureDetector(
                              onTap: () {
                                controller.district.value =
                                    e.cityName.toString();
                                controller.idCity = e.cityId.toString();
                                controller.subDistrict.value =
                                    "Pilih Kecamatan Anda";
                                controller.idSubdistrict = null;
                                print(controller.idCity);
                                controller.postalCode.value =
                                    e.postalCode.toString();
                                Get.back();
                              },
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Text(
                                    e.cityName.toString(),
                                    style: labelStyle,
                                  )),
                            ))
                      ],
                    );
                  })
            ]))
          ],
        )),
      );
    }

    subdistrictBox(context) {
      return Scaffold(
        body: Container(
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
                  Icons.close,
                  color: primaryColor,
                ),
              ),
              flexibleSpace: Container(
                child: Center(
                  child: Text(
                    "Choise SubDistrict",
                    style: ProductNameStyle.copyWith(fontSize: 18),
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: ongkirC.getSubdistrict(controller.idCity!),
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        ...ongkirC.listSubdistrict.map((e) => GestureDetector(
                              onTap: () {
                                controller.subDistrict.value =
                                    e.subdistrictName.toString();
                                controller.idSubdistrict = e.id.toString();
                                Get.back();
                              },
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Text(
                                    e.subdistrictName.toString(),
                                    style: labelStyle,
                                  )),
                            ))
                      ],
                    );
                  })
            ]))
          ],
        )),
      );
    }

    Widget _ProvinsiDropDown() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Province",
              style: labelStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 4,
            ),
            GestureDetector(
              onTap: () {
                ongkirC.getProvince();
                showDialog(
                  context: context,
                  builder: (context) => ProvinceBox(context),
                );
              },
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5)),
                height: 45,
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${controller.province.value}",
                        style: ProductCategoryStyle.copyWith(fontSize: 14),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: primaryColor,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget _DistrictDropDown() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "District / City",
              style: labelStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 4,
            ),
            GestureDetector(
              onTap: () {
                // print(idprovince);
                if (controller.idprovince != null) {
                  showDialog(
                    context: context,
                    builder: (context) => districtBox(context),
                  );
                } else {
                  Get.snackbar("Field Provinsi Kosong",
                      "Field Provinsi Tidak Boleh Kosong",
                      backgroundColor: Color.fromARGB(255, 249, 179, 118),
                      colorText: Colors.white,
                      snackStyle: SnackStyle.FLOATING);
                }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5)),
                height: 45,
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${controller.district.value}",
                        style: ProductCategoryStyle.copyWith(fontSize: 14),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: primaryColor,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget _SubdistrictDropDown() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Subdistrict",
              style: labelStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 4,
            ),
            GestureDetector(
              onTap: () {
                if (controller.idCity != null) {
                  showDialog(
                    context: context,
                    builder: (context) => subdistrictBox(context),
                  );
                } else {
                  Get.snackbar(
                      "Field City Kosong", "Field City Tidak Boleh Kosong",
                      backgroundColor: Color.fromARGB(255, 249, 179, 118),
                      colorText: Colors.white,
                      snackStyle: SnackStyle.FLOATING);
                }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5)),
                height: 45,
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${controller.subDistrict.value}",
                        style: ProductCategoryStyle.copyWith(fontSize: 14),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: primaryColor,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget _PostalCode() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Postal Code",
              style: labelStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5)),
              height: 45,
              child: Obx(
                () => Text(
                  "${controller.postalCode.value}",
                  style: ProductCategoryStyle.copyWith(fontSize: 14),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget _detailAddress() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Address details",
              style: labelStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 4,
            ),
            TextField(
              controller: controller.detailC,
              keyboardType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
              decoration: InputDecoration(
                hintText: "Jln xxx",
                iconColor: primaryColor,
                prefixIconColor: primaryColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: primaryColor),
                ),
              ),
              minLines: 1,
              maxLines: 10,
            )
          ],
        ),
      );
    }

    return FutureBuilder(
        future: controller.getAddressUser(umumC.user.value.id.toString()),
        builder: (context, snapshot) {
          return Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    elevation: 0,
                    pinned: true,
                    backgroundColor: Colors.white,
                    actions: [
                      GestureDetector(
                        onTap: () {
                          
                          controller.idprovince!.isEmpty ?
                          ongkirC.AddAddress(
                              umumC.user.value.id.toString(),
                              controller.idprovince!,
                              controller.province.value,
                              controller.idCity!,
                              controller.district.value,
                              controller.idSubdistrict!,
                              controller.subDistrict.value,
                              controller.postalCode.value,
                              controller.detailC.text) : Get.back(); 
                        },
                        child: Container(
                            margin: EdgeInsets.only(right: 29),
                            child: Icon(
                              Icons.check,
                              color: primaryColor,
                              size: 25,
                            )),
                      )
                    ],
                    leading: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.close,
                        color: primaryColor,
                      ),
                    ),
                    flexibleSpace: Container(
                      child: Center(
                        child: Text(
                          "Edit Address",
                          style: ProductNameStyle.copyWith(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    SizedBox(
                      height: 38,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: _ProvinsiDropDown(),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: _DistrictDropDown(),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: _SubdistrictDropDown(),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: _PostalCode(),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: _detailAddress(),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                  ]))
                ],
              ),
            ),
          );
        });
  }
}
