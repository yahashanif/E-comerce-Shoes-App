import 'package:e_comerce_shoes/app/controllers/umum_controller.dart';
import 'package:e_comerce_shoes/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final umumC = Get.find<UmumController>();
    Future.delayed(const Duration(seconds: 5), () {
     umumC.CheckUser(box.read("id_user").toString());
    });
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/lottie/2.json"),
      ),
    );
  }
}
