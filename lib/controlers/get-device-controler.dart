
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../utils/app-constant.dart';

class GetDeviceToken extends GetxController{
  
  String?deviceToken;     

@override
  void onInit() {
    super.onInit();
    getdeviceToken();
  } 

 Future<void> getdeviceToken() async{
  try{
    String? token =await FirebaseMessaging.instance.getToken();
    if(token!=null){
      deviceToken=token;
      update();
    }

  }catch(e){
    Get.snackbar(
        'Error!',
        '$e',
        backgroundColor: Appconstant.appSecondryColor,
        colorText: Appconstant.appTextColor,
        snackPosition: SnackPosition.TOP,
      );
  }
 }
}