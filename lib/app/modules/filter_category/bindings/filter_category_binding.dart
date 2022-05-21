import 'package:get/get.dart';

import '../controllers/filter_category_controller.dart';

class FilterCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FilterCategoryController>(
      () => FilterCategoryController(),
    );
  }
}
