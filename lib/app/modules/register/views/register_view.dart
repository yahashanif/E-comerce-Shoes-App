import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../theme.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
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

    Widget _FullNameField() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "FullName",
              style: labelStyle,
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              autocorrect: false,
              enableSuggestions: false,
              decoration: InputDecoration(
                hintText: "FullName",
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

    Widget _EmailField() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: labelStyle,
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              autocorrect: false,
              enableSuggestions: false,
              decoration: InputDecoration(
                hintText: "Email",
                iconColor: primaryColor,
                prefixIcon: Icon(
                  Icons.email,
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

    Widget _ButtonSignUp() {
      return GestureDetector(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: primaryColor),
          child: Center(
            child: Text(
              "Sign Up",
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
                    "Sign Up",
                    style: TitleStyle,
                  ),
                  Text(
                    "Register and Happy Shoping",
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
                _FullNameField(),
                SizedBox(
                  height: 20,
                ),
                _EmailField(),
                SizedBox(
                  height: 20,
                ),
                _PasswordField(),
                SizedBox(
                  height: 40,
                ),
                _ButtonSignUp(),
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
                "Already have an account?",
                style: GoogleFonts.poppins(fontSize: 12, color: greyColor),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  " Sign In",
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
