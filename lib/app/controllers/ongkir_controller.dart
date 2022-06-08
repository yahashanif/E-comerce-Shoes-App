import 'dart:convert';

import 'package:e_comerce_shoes/app/controllers/umum_controller.dart';
import 'package:e_comerce_shoes/app/data/models/address_model.dart';
import 'package:e_comerce_shoes/app/data/models/subdistrict_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/models/kota_model.dart';
import '../data/models/province_model.dart';
import 'package:http/http.dart' as http;

final box = GetStorage();

class OngkirController extends GetxController {
  var address = Address().obs;
  var listProvince = <Province>[].obs;
  var listCity = <Kota>[].obs;
  var listSubdistrict = <Subdistrict>[].obs;
  var header = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ' + box.read("token"),
  };
  var header2 = {
    'Authorization': 'Bearer ' + box.read("token"),
  };
  Future<void> getProvince() async {
    listProvince.clear();
    String url = baseUrl + "api/auth/provinsi";
    final response = await http.get(Uri.parse(url), headers: header);
    var data = jsonDecode(response.body);
    print(response.body);
    List dataList = data['data'] as List;
    List<Province> _provinsi =
        dataList.map((e) => Province.fromJson(e)).toList();
    _provinsi.map((e) {
      listProvince.add(e);
      listProvince.refresh();
    }).toList();
  }

  Future<void> getCity(String province_id) async {
    listCity.clear();
    String url = baseUrl + "api/auth/city/" + province_id;
    final response = await http.get(Uri.parse(url), headers: header);
    var data = jsonDecode(response.body);
    print(response.body);
    List dataList = data['data'] as List;
    List<Kota> _kota = dataList.map((e) => Kota.fromJson(e)).toList();
    _kota.map((e) {
      listCity.add(e);
      listCity.refresh();
    }).toList();
    print(listCity);
  }

  Future<void> getSubdistrict(String city_id) async {
    listSubdistrict.clear();
    String url = baseUrl + "api/auth/subdistrict/" + city_id;
    final response = await http.get(Uri.parse(url), headers: header);
    var data = jsonDecode(response.body);
    print(response.body);
    List dataList = data['data'] as List;
    List<Subdistrict> _sub =
        dataList.map((e) => Subdistrict.fromJson(e)).toList();
    _sub.map((e) {
      listSubdistrict.add(e);
      listSubdistrict.refresh();
    }).toList();
    print(listCity);
  }

  Future<void> AddAddress(
      String id_user,
      String id_province,
      String province,
      String id_city,
      String city,
      String idSubdistrict,
      String subDistrict,
      String postalCode,
      String detailAddress) async {
    String url = baseUrl + "api/auth/AddAddress";
    final response = await http.post(Uri.parse(url), headers: header2, body: {
      "id_user": id_user,
      "id_province": id_province,
      "province": province,
      "id_city": id_city,
      "city": city,
      "id_subdistrict": idSubdistrict,
      "subdistrict": subDistrict,
      "postal_code": postalCode,
      "detail_address": detailAddress,
    });

    if (response.statusCode == 200) {
      Get.back();
    } else {
      Get.snackbar("Proses Failed", "Gagal Input Alamat",
          backgroundColor: Color.fromARGB(255, 249, 179, 118),
          colorText: Colors.white,
          snackStyle: SnackStyle.FLOATING);
    }
  }
  Future<void> getAddress(String id_user) async {
    String url = baseUrl + "api/auth/Address/" + id_user;
    final response = await http.get(Uri.parse(url), headers: header);
    var data = jsonDecode(response.body);
    address.value = Address.fromJson(data["data"]);
    address.refresh;
    print(response.body);

  }
}
