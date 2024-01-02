import 'package:cab_tab/Screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Controllers/registration_page_controller.dart';
import '../Routes/routes.dart';
import '../Widgets/TextField.dart';
import '../Widgets/custom_button_orange.dart';

class RegistrationsPage extends StatefulWidget {
  const RegistrationsPage({Key? key}) : super(key: key);

  @override
  State<RegistrationsPage> createState() => _RegistrationsPageState();
}

class _RegistrationsPageState extends State<RegistrationsPage> {
  static const appName = "APP Name";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegistrationController registrationController = Get.put(RegistrationController());


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
                    const SizedBox(height: 5),
                    const Text(
                      appName,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
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
                              "Create New Account",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 25),
                            ),
                            Text(
                              "Fill in the details below to get started with us.",
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
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextInputField(
                                "Name",
                                "Please enter Your Name",
                                const Icon(Icons.person),
                                TextInputType.text,
                                false,
                                (value) {
                                  if (value?.isEmpty ?? true) {
                                    return 'Name cannot be empty';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextInputField(
                                "Phone",
                                "Please Enter Your Phone",
                                const Icon(Icons.phone_android),
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
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextInputField(
                                "Password",
                                "Please Enter Your Password",
                                const Icon(Icons.lock),
                                TextInputType.visiblePassword,
                                true,
                                (value) {
                                  if (value != null && value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: height * 0.029,
                              ),
                              CustomButton(
                                "Sign In",height * 0.052,
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    Get.toNamed(Routes.OTP_VERIFICATION);
                                    registrationController.register();
                                  } else {
                                    debugPrint("not");
                                    print("validate please");
                                  }
                                },
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.lOGIN_PAGE);
                                },
                                child: RichText(
                                  text: TextSpan(
                                      text: "",
                                      children: <TextSpan>[
                                        const TextSpan(
                                          text: 'Already a User!',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' log in',
                                          style: TextStyle(
                                            color: Colors.blue.shade800,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 16.2,
                                          ),
                                        ),
                                      ]
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
            ],
          ),
        ),
      ),
    );
  }
}
