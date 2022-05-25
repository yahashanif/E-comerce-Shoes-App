import 'package:get/get.dart';

import 'package:e_comerce_shoes/app/modules/My_Orders/bindings/my_orders_binding.dart';
import 'package:e_comerce_shoes/app/modules/My_Orders/views/my_orders_view.dart';
import 'package:e_comerce_shoes/app/modules/cart/bindings/cart_binding.dart';
import 'package:e_comerce_shoes/app/modules/cart/views/cart_view.dart';
import 'package:e_comerce_shoes/app/modules/checkout/bindings/checkout_binding.dart';
import 'package:e_comerce_shoes/app/modules/checkout/views/checkout_view.dart';
import 'package:e_comerce_shoes/app/modules/detail_product/bindings/detail_product_binding.dart';
import 'package:e_comerce_shoes/app/modules/detail_product/views/detail_product_view.dart';
import 'package:e_comerce_shoes/app/modules/edit_address/bindings/edit_address_binding.dart';
import 'package:e_comerce_shoes/app/modules/edit_address/views/edit_address_view.dart';
import 'package:e_comerce_shoes/app/modules/edit_profile/bindings/edit_profile_binding.dart';
import 'package:e_comerce_shoes/app/modules/edit_profile/views/edit_profile_view.dart';
import 'package:e_comerce_shoes/app/modules/favorite/bindings/favorite_binding.dart';
import 'package:e_comerce_shoes/app/modules/favorite/views/favorite_view.dart';
import 'package:e_comerce_shoes/app/modules/filter_category/bindings/filter_category_binding.dart';
import 'package:e_comerce_shoes/app/modules/filter_category/views/filter_category_view.dart';
import 'package:e_comerce_shoes/app/modules/home/bindings/home_binding.dart';
import 'package:e_comerce_shoes/app/modules/home/views/home_view.dart';
import 'package:e_comerce_shoes/app/modules/login/bindings/login_binding.dart';
import 'package:e_comerce_shoes/app/modules/login/views/login_view.dart';
import 'package:e_comerce_shoes/app/modules/profile/bindings/profile_binding.dart';
import 'package:e_comerce_shoes/app/modules/profile/views/profile_view.dart';
import 'package:e_comerce_shoes/app/modules/register/bindings/register_binding.dart';
import 'package:e_comerce_shoes/app/modules/register/views/register_view.dart';
import 'package:e_comerce_shoes/app/pages/splash_screen.dart';
import 'package:e_comerce_shoes/main_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.Splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: _Paths.Splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: _Paths.MainPage,
      page: () => MainPage(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUCT,
      page: () => DetailProductView(),
      binding: DetailProductBinding(),
    ),
    GetPage(
      name: _Paths.FILTER_CATEGORY,
      page: () => FilterCategoryView(),
      binding: FilterCategoryBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => CheckoutView(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_ADDRESS,
      page: () => EditAddressView(),
      binding: EditAddressBinding(),
    ),
    GetPage(
      name: _Paths.MY_ORDERS,
      page: () => MyOrdersView(),
      binding: MyOrdersBinding(),
    ),
  ];
}
