import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_comerce_shoes/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../theme.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
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
            GestureDetector(
              onTap: (){
                Get.toNamed(Routes.FILTER_CATEGORY);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 45,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("assets/categori1.png"),
                        fit: BoxFit.cover)),
              ),
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

    Widget header() {
      return Container(
        
        margin: EdgeInsets.only(top: 10, bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5))
        ),
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
            GestureDetector(
              onTap: (){
                Get.toNamed(Routes.CART);
              },
              child: Container(
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
              ),
            )
          ],
        ),
      );
    }

    Widget _DataUser() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi Hanif",
                    style: NameStyle.copyWith(fontSize: 22),
                  ),
                  Text(
                    "Today, Thursday 12 Mei",
                    style: subTitleStyle.copyWith(
                        fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/test.jpg"),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.grey),
              )
            ],
          ),
        ),
      );
    }

    Widget _carausel() {
      return CarouselSlider(
        options: CarouselOptions(height: 176.0),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("assets/test.jpg"),
                        fit: BoxFit.cover)),
              );
            },
          );
        }).toList(),
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
            SizedBox(
              height: 24,
            ),
            _DataUser(),
            SizedBox(
              height: 24,
            ),
            _carausel(),
            SizedBox(
              height: 14,
            ),
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
