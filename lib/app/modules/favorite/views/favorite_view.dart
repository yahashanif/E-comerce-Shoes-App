import 'package:e_comerce_shoes/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../theme.dart';
import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
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
              child: Column(
              children: [
                ListItem(isFavorite: true,),
                ListItem(isFavorite: true,),
              ],
            ))
          ]))
              ],
            ),
        ));
  }
}
