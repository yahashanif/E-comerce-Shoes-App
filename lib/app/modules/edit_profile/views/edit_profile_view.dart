import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../theme.dart';
import '../../../routes/app_pages.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  @override
  Widget build(BuildContext context) {
    Widget _NameField() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: labelStyle,
            ),
            TextField(
              autocorrect: false,
              enableSuggestions: false,
              decoration: InputDecoration(
                hintText: "Name",
                iconColor: primaryColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: primaryColor),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget _UsernameField() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username",
              style: labelStyle,
            ),
            TextField(
              autocorrect: false,
              enableSuggestions: false,
              decoration: InputDecoration(
                hintText: "Username",
                iconColor: primaryColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: primaryColor),
                ),
              ),
            )
          ],
        ),
      );
    }
    Widget _EmailField() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: labelStyle,
            ),
            TextField(
              autocorrect: false,
              enableSuggestions: false,
              decoration: InputDecoration(
                hintText: "Email",
                iconColor: primaryColor,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: primaryColor),
                ),
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
              backgroundColor: Colors.white,
              actions: [
                Container(
                    margin: EdgeInsets.only(right: 29),
                    child: Icon(
                      Icons.check,
                      color: primaryColor,
                      size: 25,
                    ))
              ],
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.close,
                  color: primaryColor,
                ),
              ),
              flexibleSpace: Container(
                child: Center(
                  child: Text(
                    "Edit Profile",
                    style: ProductNameStyle.copyWith(fontSize: 18),
                  ),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              SizedBox(
                height: 37,
              ),
              Center(
                  child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/test.jpg",
                        ),
                        fit: BoxFit.cover)),
              )),
              SizedBox(
                height: 38,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: _NameField(),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: _UsernameField(),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: _EmailField(),
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
