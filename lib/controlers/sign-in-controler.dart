// ignore_for_file: body_might_complete_normally_nullable, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:kapda_bazzar/utils/app-constant.dart';

class SigninContoller extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var isPasswordVisible = false.obs;

  Future<UserCredential?> signInMethod(
    String useremail,
    String userPassword,
  ) async {
    try {
      EasyLoading.show(status: 'Please wait...');
      // try to signin with email and password.....
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: useremail, password: userPassword);

      EasyLoading.dismiss();
      return userCredential;
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
