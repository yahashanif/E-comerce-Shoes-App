import 'package:e_comerce_shoes/app/controllers/umum_controller.dart';
import 'package:e_comerce_shoes/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../theme.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  final umumC = Get.find<UmumController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: CustomScrollView(
              slivers: [
          SliverAppBar(
            elevation: 0,
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: Container(
              child: Center(
                child: Text(
                  "Favorite Shoes",
                  style: ProductNameStyle.copyWith(fontSize: 18),
                ),
              ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30,vertical: 24),
              child: StreamBuilder<void>(
                stream: umumC.getFavoriteStream(),
                builder: (context, snapshot) {
                  return Column(
                  children: [
                   ...umumC.listProductFavorite.map((element) =>  ListItem(isFavorite: true,product: element),).toList()
                  ],
                          );
                }
              ))
          ]))
              ],
            ),
        ));
  }
}
