import 'package:e_comerce_shoes/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Get.offAllNamed(Routes.MainPage);
    });
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/lottie/2.json"),
      ),
    );
  }
}
