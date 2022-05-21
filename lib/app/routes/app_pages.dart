import 'package:get/get.dart';

import 'package:e_comerce_shoes/app/modules/detail_product/bindings/detail_product_binding.dart';
import 'package:e_comerce_shoes/app/modules/detail_product/views/detail_product_view.dart';
import 'package:e_comerce_shoes/app/modules/filter_category/bindings/filter_category_binding.dart';
import 'package:e_comerce_shoes/app/modules/filter_category/views/filter_category_view.dart';
import 'package:e_comerce_shoes/app/modules/home/bindings/home_binding.dart';
import 'package:e_comerce_shoes/app/modules/home/views/home_view.dart';
import 'package:e_comerce_shoes/app/modules/login/bindings/login_binding.dart';
import 'package:e_comerce_shoes/app/modules/login/views/login_view.dart';
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
  ];
}
