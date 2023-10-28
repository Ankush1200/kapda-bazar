// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors

// import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../../utils/app-constant.dart';
import '../../widgets/banner-widget.dart';
import '../../widgets/custom-drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kapda-Bazaar'),
        centerTitle: true,
        backgroundColor: Appconstant.appMainColor,
        // actions: [],
      ),
      drawer:const CustomDrawer(),
      body:  SingleChildScrollView(
        physics:BouncingScrollPhysics(),
        child: Container(
          child: Column(
          children: [
          // SizedBox(height: Get.height/90,),
          Banners(),
          ]),
        ),
      ),
    );
  }
}
