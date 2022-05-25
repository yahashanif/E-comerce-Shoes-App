import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrdersController extends GetxController {
  //TODO: Implement MyOrdersController
  ScrollController scrollC = ScrollController();

 @override
 void dispose() {
   scrollC.dispose();
   super.dispose();
 }
}
