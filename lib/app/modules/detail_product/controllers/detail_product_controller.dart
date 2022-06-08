import 'package:get/get.dart';

import '../../../controllers/umum_controller.dart';

class DetailProductController extends GetxController {
   final umumc = Get.find<UmumController>();
  var id_product_detail = "".obs;

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
