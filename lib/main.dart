import 'package:e_comerce_shoes/app/controllers/ongkir_controller.dart';
import 'package:e_comerce_shoes/app/controllers/umum_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    final ongkirC = Get.put(OngkirController(), permanent: true);
    final umumC = Get.put(UmumController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: Routes.Splash,
        getPages: AppPages.routes,
      );
    });
  }
}
