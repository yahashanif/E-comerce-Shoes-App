import 'package:e_comerce_shoes/app/routes/app_pages.dart';
import 'package:e_comerce_shoes/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    Widget _UsernameField() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Username",
              style: labelStyle,
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              autocorrect: false,
              enableSuggestions: false,
              decoration: InputDecoration(
                hintText: "Username",
                iconColor: primaryColor,
                prefixIcon: Icon(
                  Icons.person_pin,
                  color: primaryColor,
                ),
                prefixIconColor: primaryColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
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

    Widget _PasswordField() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password",
              style: labelStyle,
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              decoration: InputDecoration(
                hintText: "Password",
                iconColor: primaryColor,
                prefixIcon: Icon(
                  Icons.lock,
                  color: primaryColor,
                ),
                prefixIconColor: primaryColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
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

    Widget _ButtonLogin() {
      return GestureDetector(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: primaryColor),
          child: Center(
            child: Text(
              "Sign In",
              style: buttonStyle,
            ),
          ),
        ),
      );
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: size.height / 5,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TitleStyle,
                  ),
                  Text(
                    "Sign In to Countinue",
                    style: subTitleStyle,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SizedBox(
                  height: 17,
                ),
                _UsernameField(),
                SizedBox(
                  height: 20,
                ),
                _PasswordField(),
                SizedBox(
                  height: 40,
                ),
                _ButtonLogin(),
              ],
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: GoogleFonts.poppins(fontSize: 12, color: greyColor),
              ),
              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.REGISTER);
                },
                child: Text(
                  " Sign up",
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 18,
          ),
        ],
      ),
    );
  }
}
