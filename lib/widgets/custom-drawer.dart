import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kapda_bazzar/utils/app-constant.dart';

import '../screens/auth-ui/welcome-screen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:Appconstant.appMainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), bottomRight: Radius.circular(30),),
      ), 
      child:Wrap(
        runSpacing:10,
        children: [
          const Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),),
          const ListTile(
            titleAlignment:ListTileTitleAlignment.center, 
            title: Text('Kapda-Bazaar'),
            subtitle: Text('1.14.0'),
            leading: CircleAvatar(
              backgroundColor: Appconstant.appSecondryColor,
              radius: 20.0,
              child: Text('KB'),
            ),
          ),
          // Divider(
          //   indent:10,
          //   endIndent:10,
          //   thickness: 1.5,
          //   color: Colors.grey,
          // ),
          const ListTile(
            titleAlignment:ListTileTitleAlignment.center, 
            title: Text('Home'),
            leading: Icon(Icons.home),
            trailing:Icon(Icons.arrow_forward),            
          ), 
          const ListTile(
            titleAlignment:ListTileTitleAlignment.center, 
            title: Text('Products'),
            leading: Icon(Icons.production_quantity_limits_sharp),
            trailing:Icon(Icons.arrow_forward),            
          ),
          const ListTile(
            titleAlignment:ListTileTitleAlignment.center, 
            title: Text('Reminder'),
            leading: Icon(Icons.lightbulb),
            trailing:Icon(Icons.arrow_forward),            
          ),
          const ListTile(
            titleAlignment:ListTileTitleAlignment.center, 
            title: Text('Orders'),
            leading: Icon(Icons.check_circle_sharp),
            trailing:Icon(Icons.arrow_forward),            
          ),
          const ListTile(
            titleAlignment:ListTileTitleAlignment.center, 
            title:Text('Contacts'),
            leading:Icon(Icons.contact_support),
            trailing:Icon(Icons.arrow_forward),            
          ),
          ListTile(
            onTap: () async{
              GoogleSignIn googleSignIn = GoogleSignIn();
              FirebaseAuth _auth = FirebaseAuth.instance;
              await _auth.signOut();
              await googleSignIn.signOut();
              Get.offAll(() => WelcomeScreen());
            },
            titleAlignment:ListTileTitleAlignment.center, 
            title:const Text('Logout'),
            leading:const Icon(Icons.logout),
            trailing:const Icon(Icons.arrow_forward),            
          ),
        ],
      ),
    );
  }
}
