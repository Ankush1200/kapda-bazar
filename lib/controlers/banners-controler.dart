
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
class BannersControlers extends GetxController{

  RxList<String> bannersUrl=RxList<String>([]);

  @override
  void onInit(){
    super.onInit();
    getbannersUrl();
  } 

  Future<void>getbannersUrl() async{
    try{
      QuerySnapshot bannerSnapshot= await FirebaseFirestore.instance.collection('banners').get();

      if(bannerSnapshot.docs.isNotEmpty){
        bannersUrl.value=bannerSnapshot.docs.map((doc) =>doc['imageUrl'] as String).toList();
      }

    }catch(e){
      print('Error $e');
    }
  } 
}