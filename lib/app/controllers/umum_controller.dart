import 'package:get/get.dart';

class UmumController extends GetxController {
  //TODO: Implement UmumController
var Navbar = 0.obs;
  final count = 0.obs;
  @override
  void onInit() {
    Navbar.value = 0;
    super.onInit();
  }
  @override
  void dispose() {
    Navbar.value = 0;
    super.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
