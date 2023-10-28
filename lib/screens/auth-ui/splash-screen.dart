// ignore_for_file: file_names,
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kapda_bazzar/screens/user-panel/main-screen.dart';

import 'package:lottie/lottie.dart';

import '../../utils/app-constant.dart';
import 'welcome-screen.dart';

class SplashScreen extends StatefulWidget {
 const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  User? user=FirebaseAuth.instance.currentUser;
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAll(()=> user!=null?const MainScreen():WelcomeScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appconstant.appSecondryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:Appconstant.appSecondryColor,
      ),
      body:Container(
         child: Column(
        crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container( 
                alignment:Alignment.center,
                child: Lottie.asset('assets/images/animation_lnkk18ys.json'),
              ),
            ),
            const SizedBox(height:20,),
            Container(
              width: Get.width,
              margin: const EdgeInsets.only(bottom:30),
              alignment: Alignment.center,
              // size=size.width;
              child: Text(Appconstant.appPoweredBy,
              style: const TextStyle(
                fontSize:15,
                fontWeight: FontWeight.bold,
                color: Appconstant.appTextColor,
              ),
              ),
            )
          ],
         ),
      ),
    );
  }
}