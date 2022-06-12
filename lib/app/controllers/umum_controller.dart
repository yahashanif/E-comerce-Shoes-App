import 'dart:convert';

import 'package:e_comerce_shoes/app/data/models/cart_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../data/models/categori_model_model.dart';
import '../data/models/product_model.dart';
import '../data/models/user_model.dart';
import '../routes/app_pages.dart';

String baseUrl = "http://192.168.100.30:9000/";

class UmumController extends GetxController {
  final box = GetStorage();
  var user = User().obs;
  var categories = <CategoriModel>[].obs;
  var listProducts = <Product>[].obs;
  var listProductsDetail = <ProductDetails>[].obs;
  var listProductImage = <ProductImage>[].obs;
  var product = Product().obs;
  var listCart = <Cart>[].obs;
  var subtotal = 0.obs;
  var jumitem = 0.obs;
  var listProductFavorite = <Product>[].obs;

  // Address
  var province = "Pilih Provinsi Anda".obs;
  var district = "Pilih Kabupaten / Kota Anda".obs;
  var subDistrict = "Pilih Kecamatan Anda".obs;
  var postalCode = "----".obs;
  bool address = false;

  String? idprovince;
  String? idCity;
  String? idSubdistrict;
  String? detailAddress;

  Stream<void> getFavoriteStream() {
    return Stream.periodic(Duration(seconds: 1))
        .asyncMap((event) => getProductsFavorite());
  }

  Future<void> LoginUser(String username, String password) async {
    var header = {
      "Accept": "application/json",
    };
    String url = baseUrl + "loginCustomer";
    print(url);
    final response = await http.post(Uri.parse(url), headers: header, body: {
      "username": username,
      "password": password,
    });
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      user.value = User.fromJson(data["data"]["data"]);
      box.write("token", data["token"]);

      box.write("id_user", data["data"]["data"]["id"]);
      print(box.read("token"));
      if (box.read("token") != null) {
        getAddressUser();

        Get.toNamed(Routes.MainPage);
      } else {
        Get.snackbar("Login Gagal", "Username Or Password Wrong");
      }
    } else {
      Get.snackbar("Login Gagal", "Username Or Password Wrong");
    }
  }

  Future<void> CheckUser(String id) async {
    if (box.read("token") == null) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      var header = {
        "Accept": "application/json",
        "Authorization": "Bearer " + box.read("token")
      };
      String url = baseUrl + "api/auth/checkUser/" + id;
      print(url);
      final response = await http.get(
        Uri.parse(url),
        headers: header,
      );
      print(response.body);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        user.value = User.fromJson(data["data"]);
        getAddressUser();
        Get.offAllNamed(Routes.MainPage);
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    }
  }

  Future<void> getCategory() async {
    categories.clear();
    var header = {
      "Accept": "application/json",
      "Authorization": "Bearer " + box.read("token")
    };
    String url = baseUrl + "api/auth/category";
    print(url);
    final response = await http.get(
      Uri.parse(url),
      headers: header,
    );
    var data = jsonDecode(response.body);
    print(response.body);
    List dataList = data['data'] as List;
    List<CategoriModel> _category =
        dataList.map((e) => CategoriModel.fromJson(e)).toList();
    _category.map((e) {
      categories.add(e);
      categories.refresh();
    }).toList();
  }

  Future<void> AddCart(String id_product_detail, String quantity) async {
    var header = {
      "Accept": "application/json",
      "Authorization": "Bearer " + box.read("token")
    };
    String url = baseUrl + "api/auth/addCart";
    print(url);
    final response = await http.post(Uri.parse(url), headers: header, body: {
      "id_user": user.value.id.toString(),
      "id_product_detail": id_product_detail,
      "quantity": quantity,
    });
    if (response.statusCode == 200) {
      Get.toNamed(Routes.CART);
    }
  }

  Future<RxList<Cart>> getCart() async {
    listCart.clear();
    subtotal.value = 0;
    jumitem.value = 0;
    var header = {
      "Accept": "application/json",
      "Authorization": "Bearer " + box.read("token")
    };
    String url = baseUrl + "api/auth/cart/" + user.value.id.toString();
    print(url);
    final response = await http.get(
      Uri.parse(url),
      headers: header,
    );
    var data = jsonDecode(response.body);
    print(response.body);
    List dataList = data['data'] as List;
    RxList<Cart> _cart = dataList.map((e) => Cart.fromJson(e)).toList().obs;
    _cart.map((e) {
      subtotal.value += e.product!.harga!.toInt() * e.quantity!.toInt();
      jumitem.value += e.quantity!.toInt();
      //   listCart.add(e);
      //   listCart.refresh();
    }).toList();

    listCart.value = _cart;
    listCart.refresh();
    return listCart;
  }

  Future<void> addQuantityCart(String id_product_detail) async {
    var header = {
      "Accept": "application/json",
      "Authorization": "Bearer " + box.read("token")
    };
    String url = baseUrl + "api/auth/addQuantityCart";
    print(url);
    final response = await http.post(Uri.parse(url), headers: header, body: {
      "id_user": user.value.id.toString(),
      "id_product_detail": id_product_detail,
    });
    if (response.statusCode == 200) {
      getCart();
    }
  }

  Future<void> MinQuantityCart(String id_product_detail) async {
    var header = {
      "Accept": "application/json",
      "Authorization": "Bearer " + box.read("token")
    };
    String url = baseUrl + "api/auth/minQuantityCart";
    print(url);
    final response = await http.post(Uri.parse(url), headers: header, body: {
      "id_user": user.value.id.toString(),
      "id_product_detail": id_product_detail,
    });
    if (response.statusCode == 200) {
      getCart();
    }
  }

  Future<void> DeleteCart(String id_product_detail) async {
    var header = {
      "Accept": "application/json",
      "Authorization": "Bearer " + box.read("token")
    };
    String url = baseUrl +
        "api/auth/deleteCart/${user.value.id.toString()}/${id_product_detail}";
    print(url);
    final response = await http.delete(Uri.parse(url), headers: header);
    print(response.body);
    if (response.statusCode == 200) {
      getCart();
    }
  }

  Future<void> getProductsFavorite() async {
    listProductFavorite.clear();
    var header = {
      "Accept": "application/json",
      "Authorization": "Bearer " + box.read("token")
    };
    String url = baseUrl + "api/auth/favorite/" + user.value.id.toString();
    print(url);
    final response = await http.get(
      Uri.parse(url),
      headers: header,
    );
    var data = jsonDecode(response.body);
    print(response.body);
    List dataList = data['data'] as List;
    List<Product> _products = dataList.map((e) => Product.fromJson(e)).toList();
    _products.map((e) {
      listProductFavorite.add(e);
      listProductFavorite.refresh();
    }).toList();
  }

  Future<void> getAddressUser() async {
    var header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + box.read("token"),
    };
    String url = baseUrl + "api/auth/Address/" + user.value.id.toString();
    final response = await http.get(Uri.parse(url), headers: header);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      province.value = data["data"]["province"];
      district.value = data["data"]["city"];
      subDistrict.value = data["data"]["subdstrict"];
      postalCode.value = data["data"]["postal_code"];
      detailAddress = data["data"]["detail_address"];
      idprovince = data["data"]["id_province"];
      idCity = data["data"]["id_city"];
      idSubdistrict = data["data"]["id_subdistrict"];
      address = true;
    }else{
      address = false;
    }

    print(response.body);
  }

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
}
