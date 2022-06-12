import 'package:e_comerce_shoes/app/controllers/ongkir_controller.dart';
import 'package:e_comerce_shoes/app/data/models/Ongkir_pilih_model.dart';
import 'package:e_comerce_shoes/app/data/models/ongkir_model.dart';
import 'package:e_comerce_shoes/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/list_kurir_controller.dart';

class ListKurirView extends GetView<ListKurirController> {
  final ongkirC = Get.find<OngkirController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opsi Pengiriman'),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        titleTextStyle:
            subTitleStyle.copyWith(color: Colors.black, fontSize: 16),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "PILIH JASA PENGIRIMAN",
                      style: labelStyle,
                    ),
                    Icon(
                      Icons.shield_moon_sharp,
                      color: primaryColor,
                    )
                  ],
                ),
                Text(
                  "Estimasi Pengiriman Tergantung waktu pengemasan penjual dan waktu pengiriman ke lokasi anda",
                  style:
                      subTitleStyle.copyWith(color: Colors.black, fontSize: 12),
                )
              ],
            ),
          ),
          ...ongkirC.listOngkir
              .map((element) => Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${element.name}"),
                              ...element.costs!
                                  .map((e) => e.cost!.first.etd == ""
                                      ? Container(
                                          padding: EdgeInsets.all(8),
                                          child: Center(
                                            child: Text("Tidak Tersedia"),
                                          ))
                                      : GestureDetector(
                                          onTap: () {
                                            ongkirC.ongkirPilih.value =
                                                OngkirPilih(
                                                    code: element.code,
                                                    cost: e,
                                                    name: element.name);
                                            Get.back();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: ongkirC.ongkirPilih.value
                                                          .cost!.service ==
                                                      e.service
                                                  ? Colors.orange
                                                      .withOpacity(0.2)
                                                  : Colors.transparent,
                                            ),
                                            padding: EdgeInsets.all(8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${e.service}",
                                                      style:
                                                          labelStyle.copyWith(
                                                              fontSize: 12),
                                                    ),
                                                    Text(
                                                      "Akan diterima dalam " +
                                                          e.cost!.first.etd!
                                                              .replaceAll(
                                                                  "HARI", "") +
                                                          " hari",
                                                      style:
                                                          labelStyle.copyWith(
                                                              fontSize: 12,
                                                              color:
                                                                  primaryColor),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  "Rp. ${e.cost!.first.value!.toString()}",
                                                  style: labelStyle.copyWith(
                                                      fontSize: 14),
                                                )
                                              ],
                                            ),
                                          ),
                                        ))
                                  .toList()
                            ],
                          ),
                        ),
                        Container(
                          height: 2,
                          color: greyColor,
                        ),
                      ],
                    ),
                  ))
              .toList()
        ],
      ),
    );
  }
}
