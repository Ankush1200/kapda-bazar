// ignore_for_file: unused_field, unused_local_variable, unnecessary_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kapda_bazzar/controlers/get-device-token.dart';
import 'package:kapda_bazzar/models/user-model.dart';
import 'package:kapda_bazzar/screens/user-panel/main-screen.dart';

class GoogleSigninController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance; 
  
  // final user = FirebaseAuth.instance.currentUser;
  
  Future<void> signInWithGoogle() async {

    GetDeviceTokenController getDeviceTokenController=Get.put(GetDeviceTokenController());

    try {
      
      final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        EasyLoading.show(status: 'Please wait...');
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
            
        final User? user = userCredential.user;

        if (user != null) {
          UserModel userModel = UserModel(
              uId: user.uid,
              username: user.email.toString(),
              email: user.email.toString(),
              phone: user.phoneNumber.toString(),
              userImg: user.photoURL.toString(),
              userDeviceToken: getDeviceTokenController.deviceToken.toString(),
              country: '',
              userAddress: '',
              street: '',
              isAdmin: false,
              isActive: true,
              createdOn: DateTime.now(),
              city: '');

              await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .set(userModel.toMap());
              EasyLoading.dismiss();
              Get.offAll(()=>const MainScreen());
        }
      }
    } catch (e) {
      EasyLoading.dismiss();
      print('Error $e');
    }
  }
}
