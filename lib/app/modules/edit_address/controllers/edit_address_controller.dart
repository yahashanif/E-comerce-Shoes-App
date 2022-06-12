import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../controllers/ongkir_controller.dart';
import '../../../controllers/umum_controller.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/address_model.dart';

class EditAddressController extends GetxController {
  //TODO: Implement EditAddressController
 

  late TextEditingController detailC;


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
