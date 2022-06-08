import 'dart:convert';

import 'package:e_comerce_shoes/app/data/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../../../controllers/umum_controller.dart';

class LoginController extends GetxController {
// out: GetX is the best
  late TextEditingController userC;
  late TextEditingController passC;
  final box = GetStorage();
  @override
  void onInit() {
    userC = TextEditingController();
    passC = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    userC.dispose();
    passC.dispose();
    super.dispose();
  }

 
}
