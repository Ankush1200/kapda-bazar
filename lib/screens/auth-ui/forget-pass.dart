// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kapda_bazzar/controlers/forget-pass-controler.dart';
import 'package:kapda_bazzar/screens/auth-ui/sign-in.dart';
import 'package:lottie/lottie.dart';
import '../../utils/app-constant.dart';


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final ForgetPasswordContoller forgetPasswordContoller = Get.put(ForgetPasswordContoller());

  TextEditingController emailcontroler = TextEditingController();

  void forgetpassword() async {
    String email = emailcontroler.text.trim();


    if (email.isEmpty) {
      Get.snackbar(
        'Error!',
        'Enter your registered email',
        backgroundColor: Appconstant.appSecondryColor,
        colorText: Appconstant.appTextColor,
        snackPosition: SnackPosition.TOP,
      );
    }else{
      forgetPasswordContoller.forgerPasswordMethod(email);
      Get.offAll(()=>LoginScreen());
    } 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reset Password',
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
                height: Get.width /10,
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
              SizedBox(
                height: Get.width /10,
              ),
              Material(
                child: SizedBox(
                  width: Get.width / 1.5,
                  height: Get.height / 18,
                  child: TextButton(
                    onPressed: () {
                      forgetpassword();
                    },
                    child: Text(
                      'Sent',
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
            ],
          ),
        ),
      ),
    );
  }
}
