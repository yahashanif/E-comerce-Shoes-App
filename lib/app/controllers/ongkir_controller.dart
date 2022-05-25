import 'dart:convert';

import 'package:get/get.dart';

import '../data/models/kota_model.dart';
import '../data/models/province_model.dart';
import 'package:http/http.dart' as http;

class OngkirController extends GetxController {
  var listProvince = <Province>[].obs;
  var listCity = <Kota>[].obs;

  var header = {
    'Content-Type': 'application/json',
    'key': '7fd6058a99c6de3e0c9d1443c91db318',
  };
  String baseUrl = "https://api.rajaongkir.com/starter/";
  Future<void> getProvince() async {
    listProvince.clear();
    String url = baseUrl + "province";
    final response = await http.get(Uri.parse(url), headers: header);
    var data = jsonDecode(response.body);
    List dataList = data['rajaongkir']['results'] as List;
    List<Province> _provinsi =
        dataList.map((e) => Province.fromJson(e)).toList();
    _provinsi.map((e) {
      listProvince.add(e);
      listProvince.refresh();
    }).toList();
  }
  Future<void> getCity(String province_id) async {
    listCity.clear();
    String url = baseUrl + "city?province="+province_id;
    final response = await http.get(Uri.parse(url), headers: header);
    var data = jsonDecode(response.body);
    List dataList = data['rajaongkir']['results'] as List;
    List<Kota> _kota =
        dataList.map((e) => Kota.fromJson(e)).toList();
        print(dataList);
    _kota.map((e) {
      listCity.add(e);
      listCity.refresh();
    }).toList();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
