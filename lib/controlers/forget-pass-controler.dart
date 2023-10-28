// ignore_for_file: body_might_complete_normally_nullable, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:kapda_bazzar/utils/app-constant.dart';

class ForgetPasswordContoller extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var isPasswordVisible = false.obs;

  Future<void> forgerPasswordMethod(
    String useremail,
  ) async {
    try {
      EasyLoading.show(status: 'Please wait...');
      // sent email for password reset.....
      await _auth.sendPasswordResetEmail(email: useremail);
      Get.snackbar(
        'Request send successfully✅',
        'Password reset link sent to $useremail ',
        backgroundColor: Appconstant.appSecondryColor,
        colorText: Appconstant.appTextColor,
        snackPosition: SnackPosition.TOP,
      );
      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        'Error',
        '$e',
        backgroundColor: Appconstant.appSecondryColor,
        colorText: Appconstant.appTextColor,
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
