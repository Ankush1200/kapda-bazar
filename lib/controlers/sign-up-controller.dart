// ignore_for_file: body_might_complete_normally_nullable, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:kapda_bazzar/models/user-model.dart';
import 'package:kapda_bazzar/utils/app-constant.dart';

class SignupContoller extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var isPasswordVisible = false.obs;

  Future<UserCredential?> signUpMethod(
    String username,
    String useremail,
    String userPhone,
    String userPassword,
    String confirmPassword,
    String userDeviceToken,
  ) async {
    try {
      EasyLoading.show(status: 'Please wait...');
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: useremail, password: userPassword);

      await userCredential.user!.sendEmailVerification();

      UserModel userModel = UserModel(
          uId:userCredential.user!.uid,
          username: username,
          email: useremail,
          phone: userPhone,
          userImg: '',
          userDeviceToken: userDeviceToken,
          country: '',
          userAddress: '',
          street: '',
          isAdmin: false,
          isActive: true,
          createdOn: DateTime.now(),
          city: '');


  _firestore.collection('users').doc(userCredential.user!.uid).set(userModel.toMap());
  
  EasyLoading.dismiss();
  return userCredential;    
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('Error',
      '$e',
      backgroundColor: Appconstant.appSecondryColor,
      colorText: Appconstant.appTextColor,
      snackPosition:SnackPosition.TOP,
      );
    }
  }
}
