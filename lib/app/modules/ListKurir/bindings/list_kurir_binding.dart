import 'package:get/get.dart';

import '../controllers/list_kurir_controller.dart';

class ListKurirBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListKurirController>(
      () => ListKurirController(),
    );
  }
}
