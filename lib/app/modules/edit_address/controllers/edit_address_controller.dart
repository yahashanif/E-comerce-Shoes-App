import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../controllers/ongkir_controller.dart';
import '../../../controllers/umum_controller.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/address_model.dart';

class EditAddressController extends GetxController {
  //TODO: Implement EditAddressController
  var province = "Pilih Provinsi Anda".obs;
  var district = "Pilih Kabupaten / Kota Anda".obs;
  var subDistrict = "Pilih Kecamatan Anda".obs;
  var postalCode = "----".obs;

  String? idprovince;
  String? idCity;
  String? idSubdistrict;

  late TextEditingController detailC;
  var header = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ' + box.read("token"),
  };
  Future<void> getAddressUser(String id_user) async {
    String url = baseUrl + "api/auth/Address/" + id_user;
    final response = await http.get(Uri.parse(url), headers: header);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      province.value = data["data"]["province"];
      district.value = data["data"]["city"];
      subDistrict.value = data["data"]["subdstrict"];
      postalCode.value = data["data"]["postal_code"];
      detailC.text = data["data"]["detail_address"];
      idprovince = data["data"]["id_province"];
      idCity = data["data"]["id_city"];
      idSubdistrict = data["data"]["id_subdistrict"];
    }

    print(response.body);
  }

  @override
  void onInit() {
    detailC = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    detailC.dispose();
    super.dispose();
  }
}
