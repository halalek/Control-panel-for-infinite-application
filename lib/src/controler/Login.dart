import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:structurepublic/src/models/route_argument.dart';
import 'package:structurepublic/src/repository/Loginrep.dart';

import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import '../repository/user_repository.dart' as repository;

class LoginController extends ControllerMVC {


  //User user = new User();
  bool loading = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  LoginrController() {

    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();

  }


  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;


  void logfirebase() async
  {
    print("Email:${_emailController.text}");
    print("Email:${_passwordController.text}");

    //var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);
 //  var result=LodtSettings();
   var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
    if(result != null){

      // var userinfo=FirebaseFirestore.instance.collection('users').doc().set({
      // 'email' : resulgt.user.email
      // });
      //
      print("successfully hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
    }else{
      print('user not found   hhhhhhhhhhhhhhhhhhhhhhhhhh');
    }
  }


}
