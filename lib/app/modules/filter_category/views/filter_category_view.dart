import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../theme.dart';
import '../../../../widgets/widgets.dart';
import '../controllers/filter_category_controller.dart';

class FilterCategoryView extends GetView<FilterCategoryController> {
  @override
  Widget build(BuildContext context) {
    Widget _category() {
      return Container(
        height: 120,
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 45,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage("assets/categori1.png"),
                      fit: BoxFit.cover)),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 45,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage("assets/categori1.png"),
                      fit: BoxFit.cover)),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 45,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage("assets/categori1.png"),
                      fit: BoxFit.cover)),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 45,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage("assets/categori1.png"),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
      );
    }
    Widget _categoryFilter() {
      return Container(
        height: 80,
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              height: 60,
              width: 60,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 50,
                    width: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("assets/categori1.png"),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: 0,
                    right: 1,
                    left: 35,
                    child: Container(
                      height: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red
                      ),
                      child: Icon(Icons.close,size: 15,)),
                  )
                ],
              ),
            ),
            Container(
              height: 60,
              width: 60,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 50,
                    width: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("assets/categori1.png"),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: 0,
                    right: 1,
                    left: 35,
                    child: Container(
                      height: 15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red
                      ),
                      child: Icon(Icons.close,size: 15,)),
                  )
                ],
              ),
            ),
            
          ],
        ),
      );
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5))),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextField(
                // enabled: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: primaryColor,
                    ),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    hintText: "Search",
                    alignLabelWithHint: true,
                    hintStyle: subTitleStyle.copyWith(fontSize: 15)),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Container(
              padding: EdgeInsets.all(8),
              height: 50,
              width: (MediaQuery.of(context).size.width) -
                  ((MediaQuery.of(context).size.width / 1.3) + 20 + 16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
                color: Colors.white,
              ),
              child: Image.asset(
                "assets/icons/cart.png",
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
              elevation: 0,
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              flexibleSpace: header()),
          SliverList(
              delegate: SliverChildListDelegate([
          
            _categoryFilter(),
          
            _category(),
            SizedBox(
              height: 24,
            ),
            Center(
              child: Wrap(
                children: [
                  CardItemShoes(),
                  SizedBox(
                    width: 10,
                  ),
                  CardItemShoes(),
                  SizedBox(
                    width: 10,
                  ),
                  CardItemShoes(),
                ],
              ),
            )
          ]))
        ],
      ),
    ));
  }
}
