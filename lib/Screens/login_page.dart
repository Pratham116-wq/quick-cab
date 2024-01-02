import 'package:cab_tab/Screens/homeScreen.dart';
import 'package:cab_tab/Screens/registeration_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Constants/contants.dart';
import '../Widgets/TextField.dart';
import '../Widgets/custom_button_orange.dart';
import 'otp_verification.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;



    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.orange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(height: height * 0.1),
                    Container(
                      height: height * 0.125,
                      width: height * 0.125,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      Constants.appName,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 55,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
                ),
                height: height * 0.62,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 28),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome Back",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 25),
                            ),
                            Text(
                              "Login in with your Credentials",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.062,
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 47,
                              ),
                              loginform(),
                              SizedBox(
                                height: height * 0.095,
                              ),
                              loginButtonAndnewAcc(height * 0.058)

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginform (){
    return Column(
      children: [
        CustomTextInputField(
          "Phone",
          "Please Enter Your Phone",
          Icon(Icons.phone_android),
          TextInputType.phone,
          false,
              (value) {
            if (value?.isEmpty ?? true) {
              return 'Phone cannot be empty';
            } else if (value?.length != 10) {
              return 'Phone must be 10 digits';
            }
            return null;
          },
        ),
        SizedBox(
          height: 20,
        ),
        CustomTextInputField(
          "Password",
          "Please Enter Your Password",
          Icon(Icons.lock),
          TextInputType.visiblePassword,
          true,
              (value) {
            if (value != null && value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget loginButtonAndnewAcc(double buttonheight  ){
    return Column(
      children: [
        CustomButton(
          "Sign In",buttonheight,
          onPressed: () {
            if (_formKey.currentState?.validate() ??
                false) {
              Get.toNamed('HOME_PAGE');
            } else {
              debugPrint("not");
              print("validate please");
            }
          },
        ),
        SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () {
            Get.to(RegistrationsPage());

          },
          child: RichText(
            text: TextSpan(
                text: "",
                children: <TextSpan>[
                  TextSpan(
                    text: 'Dont have and account',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: ' Sign up!',
                    style: TextStyle(
                      color: Colors.blue.shade800,
                      fontWeight: FontWeight.w800,
                      fontSize: 16.2,
                    ),
                  ),

                ]

            ),
          ),

        )
      ],
    );
  }

}
