// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kapda_bazzar/controlers/sign-in-controler.dart';
import 'package:kapda_bazzar/screens/auth-ui/forget-pass.dart';
import 'package:kapda_bazzar/screens/user-panel/main-screen.dart';
import 'package:lottie/lottie.dart';

import '../../utils/app-constant.dart';
import 'sign-up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final SigninContoller signinContoller = Get.put(SigninContoller());

  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passowrdcontroler = TextEditingController();

  void signin() async {
    String email = emailcontroler.text.trim();
    String password = passowrdcontroler.text.trim();

    if (email == '' || password == '') {
      Get.snackbar(
        'Error!',
        'All fields is required!',
        backgroundColor: Appconstant.appSecondryColor,
        colorText: Appconstant.appTextColor,
        snackPosition: SnackPosition.TOP,
      );
    } else {
      UserCredential? userCredential =
          await signinContoller.signInMethod(email, password);
      if (userCredential != null) {
        if (userCredential.user!.emailVerified) {
          Get.snackbar(
            'Success',
            'Login successfully✅',
            backgroundColor: Appconstant.appSecondryColor,
            colorText: Appconstant.appTextColor,
            snackPosition: SnackPosition.TOP,
          );
          Get.offAll(()=>MainScreen());
        } else {
          Get.snackbar(
            'Error!',
            'Please verify your email first',
            backgroundColor: Appconstant.appSecondryColor,
            colorText: Appconstant.appTextColor,
            snackPosition: SnackPosition.TOP,
          );
        }
      }
      else{
        Get.snackbar(
            'Error!',
            'Please try again!',
            backgroundColor: Appconstant.appSecondryColor,
            colorText: Appconstant.appTextColor,
            snackPosition: SnackPosition.TOP,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign In',
        ),
        backgroundColor: Appconstant.appMainColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.white,
          child: Column(
            children: [
              Column(
                children: [
                  Lottie.asset('assets/images/animation_lnl9fz5o.json')
                ],
              ),
              SizedBox(
                height: Get.width / 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: TextFormField(
                    controller: emailcontroler,
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
                  child: Obx(() => TextFormField(
                        controller: passowrdcontroler,
                        obscureText: signinContoller.isPasswordVisible.value,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          filled: true,
                          prefixIcon: Icon(Icons.password),
                          prefixIconColor: Appconstant.appSecondryColor,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              signinContoller.isPasswordVisible.toggle();
                            },
                            child: signinContoller.isPasswordVisible.value
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
                      )),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Get.to(()=>ForgetPassword());
                  },
                  child: Text(
                    'forget Password ?',
                    
                    style: TextStyle(
                      color: Appconstant.appSecondryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Material(
                child: SizedBox(
                  width: Get.width / 1.5,
                  height: Get.height / 18,
                  child: TextButton(
                    onPressed: () {
                      signin();
                    },
                    child: Text(
                      'SIGN IN',
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
                    'Don\'t have an account ? ',
                    style: TextStyle(
                      color: Appconstant.appMainColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAll(() => SignUp());
                    },
                    child: Text(
                      'SIGN UP',
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
