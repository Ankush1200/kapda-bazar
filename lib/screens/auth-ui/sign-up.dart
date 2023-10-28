// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kapda_bazzar/controlers/sign-up-controller.dart';

import '../../utils/app-constant.dart';
import 'sign-in.dart';

// ignore: must_be_immutable
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final SignupContoller signupContoller = Get.put(SignupContoller());

  TextEditingController usercontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  void signup() async {
    String username = usercontroller.text.trim();
    String userPhone = phonecontroller.text.trim();
    String useremail = emailcontroller.text.trim();
    String userpassword = passwordcontroller.text.trim();
    String userconfirmpassword = confirmpasswordcontroller.text.trim();
    String userDeviceToken = '';

    if (username.isEmpty ||
        userPhone.isEmpty ||
        useremail.isEmpty ||
        userpassword.isEmpty ||
        userconfirmpassword.isEmpty) {
      Get.snackbar(
        'Error!',
        'All Fields is required?',
        backgroundColor: Appconstant.appSecondryColor,
        colorText: Appconstant.appTextColor,
        snackPosition: SnackPosition.TOP,
      );
    }
    if (userpassword != userconfirmpassword) {
      Get.snackbar(
        'Error!',
        'Both passwords should be same*',
        backgroundColor: Appconstant.appSecondryColor,
        colorText: Appconstant.appTextColor,
        snackPosition: SnackPosition.TOP,
      );
    } else {
      UserCredential? userCredential = await signupContoller.signUpMethod(
        username,
        useremail,
        userPhone,
        userpassword,
        userconfirmpassword,
        userDeviceToken,
      );
      if (userCredential != null) {
        Get.snackbar(
          'Verification email sent ✅',
          'Please chaek your email',
          backgroundColor: Appconstant.appSecondryColor,
          colorText: Appconstant.appTextColor,
          snackPosition: SnackPosition.TOP,
        );

        FirebaseAuth.instance.signOut();
        Get.offAll(() => LoginScreen());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign up',
        ),
        backgroundColor: Appconstant.appMainColor,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          // color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: Get.width / 5,
              ),
              Column(
                children: const [
                  Text(
                    'Welcome To Sign Up Page',
                    style: TextStyle(
                        color: Appconstant.appMainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )
                ],
              ),
              SizedBox(
                height: Get.width / 5,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: TextFormField(
                    controller: usercontroller,
                    decoration: const InputDecoration(
                      hintText: 'User name',
                      filled: true,
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: Appconstant.appSecondryColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      contentPadding: EdgeInsets.only(top: 5),
                    ),
                    cursorColor: Appconstant.appSecondryColor,
                    keyboardType: TextInputType.name,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: TextFormField(
                    controller: phonecontroller,
                    decoration: const InputDecoration(
                      hintText: 'Phone',
                      filled: true,
                      prefixIcon: Icon(Icons.phone),
                      prefixIconColor: Appconstant.appSecondryColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      contentPadding: EdgeInsets.only(top: 5),
                    ),
                    cursorColor: Appconstant.appSecondryColor,
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: TextFormField(
                    controller: emailcontroller,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      filled: true,
                      prefixIcon: Icon(Icons.email),
                      prefixIconColor: Appconstant.appSecondryColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      contentPadding: EdgeInsets.only(top: 5),
                    ),
                    cursorColor: Appconstant.appSecondryColor,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Obx(
                    () => TextFormField(
                      controller: passwordcontroller,
                      obscureText: signupContoller.isPasswordVisible.value,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        prefixIcon: Icon(Icons.password),
                        prefixIconColor: Appconstant.appSecondryColor,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            signupContoller.isPasswordVisible.toggle();
                          },
                          child: signupContoller.isPasswordVisible.value
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        contentPadding: EdgeInsets.only(top: 5),
                      ),
                      cursorColor: Appconstant.appSecondryColor,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10),
                    child: Obx(
                      () => TextFormField(
                        controller: confirmpasswordcontroller,
                        obscureText: signupContoller.isPasswordVisible.value,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          filled: true,
                          prefixIcon: Icon(Icons.password),
                          prefixIconColor: Appconstant.appSecondryColor,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              signupContoller.isPasswordVisible.toggle();
                            },
                            child: signupContoller.isPasswordVisible.value
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          contentPadding: EdgeInsets.only(top: 5),
                        ),
                        cursorColor: Appconstant.appSecondryColor,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    )),
              ),
              SizedBox(
                height: Get.width / 10,
              ),
              Material(
                child: SizedBox(
                  width: Get.width / 1.5,
                  height: Get.height / 18,
                  child: TextButton(
                    onPressed: () {
                      signup();
                    },
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Appconstant.appTextColor,
                      ),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Appconstant.appMainColor),
                  ),
                ),
              ),
              SizedBox(
                height: Get.width / 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account ? ',
                    style: TextStyle(
                      color: Appconstant.appMainColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAll(() => LoginScreen());
                    },
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Appconstant.appMainColor,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
