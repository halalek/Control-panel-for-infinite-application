import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/controler/Login.dart';
import '../helpers/custom_trace.dart';
import '../models/setting.dart';

ValueNotifier<Setting> setting = new ValueNotifier(new Setting());
final navigatorKey = GlobalKey<NavigatorState>();
//LocationData locationData;

void LodtSettings() async {
  LoginController _loginrController = new LoginController();
  var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _loginrController.emailController.text,
      password: _loginrController.passwordController.text);
  //  return result;
  if (result != null) {
    print(
        "successfully hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
  }
  else {
    print('user not found   hhhhhhhhhhhhhhhhhhhhhhhhhh');
  }
}



