import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../controllers/umum_controller.dart';
import '../../../data/models/product_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final umumC = Get.find<UmumController>();
  final box = GetStorage();

  final count = 0.obs;
  // Stream<void> getProductsStream() {
  //   return Stream.periodic(Duration(seconds: 1))
  //       .asyncMap((event) => getProducts());
  // }

  Future<RxList<Product>> getProducts() async {
    var header = {
      "Accept": "application/json",
      "Authorization": "Bearer " + box.read("token")
    };
    String url = baseUrl + "api/auth/products";
    print(url);
    final response = await http.get(
      Uri.parse(url),
      headers: header,
    );
    var data = jsonDecode(response.body);
    print(response.body);
    List dataList = data['data'] as List;
    List<Product> _products = dataList.map((e) => Product.fromJson(e)).toList();
    // _products.map((e) {
    //   umumC.listProducts.add(e);
    //   umumC.listProducts.refresh();
    // }).toList();
    umumC.listProducts.value = _products;
    return umumC.listProducts;
  }

  @override
  void onInit() {
    getProducts();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  @override
  void dispose() {
    super.dispose();
  }

  void increment() => count.value++;
}
