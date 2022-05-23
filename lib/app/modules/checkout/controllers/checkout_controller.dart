import 'package:get/get.dart';

class CheckoutController extends GetxController {
  //TODO: Implement CheckoutController
  var viewAddress = false.obs;

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
