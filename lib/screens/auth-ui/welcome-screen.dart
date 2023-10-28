import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controlers/google-signin-controler.dart';
import '../../utils/app-constant.dart';
import 'sign-in.dart';

class WelcomeScreen extends StatelessWidget {
   WelcomeScreen({super.key});

  final GoogleSigninController _googleSigninController=Get.put(GoogleSigninController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome To Kapda-Bazaar'),
        backgroundColor: Appconstant.appMainColor,
      ),
      body: Container(
        color: Colors.white,
        child:Column(
          children: [
           const SizedBox(height: 50,),
           Container(
            child: 
           Lottie.asset('assets/images/animation_lnl9fz5o.json',
            ),
           ),
           const SizedBox(height:100,),
           Material(
            child:SizedBox(
              width: Get.width/1.2,
              height: Get.height/15,
              child: TextButton.icon(onPressed: (){
                _googleSigninController.signInWithGoogle();
              },
              icon:Image.asset('assets/images/google.png',
              width: Get.width/12,
              height: Get.height/12,
              ), 
              label:const Text('Sign In with google',
              style: TextStyle(color: Appconstant.appTextColor),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Appconstant.appMainColor
              ),
              ),
            ),
           ),
           const SizedBox(height:15,),
           Material(
            child:SizedBox(
              width: Get.width/1.2,
              height: Get.height/15,
              child: TextButton.icon(onPressed: (){
                Get.to(()=>const LoginScreen());
              },
              icon:const Icon(Icons.mail,
              color: Appconstant.appTextColor,
              ),
              label:const Text('Sign In with Email',
              style: TextStyle(color: Appconstant.appTextColor),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Appconstant.appMainColor
              ),
              ),
            ),
           ),
          ],
        ),
      ),
    );
  }
}