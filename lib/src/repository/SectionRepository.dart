import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/models/SectionData.dart';

import '../helpers/custom_trace.dart';
import '../models/setting.dart';

ValueNotifier<Setting> setting = new ValueNotifier(new Setting());
final navigatorKey = GlobalKey<NavigatorState>();

//LocationData locationData;

Future<List<SectionData>> getSections() async {
  List<SectionData> list = [];


  await FirebaseFirestore.instance
      .collection('section')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      list.add(SectionData.fromJson(doc.data()));
      print(doc["id"]);
    });
  });


  // await FirebaseFirestore.instance.collection('section').get().then((value) {
  //   for (int i = 0; i < value.docs.length; i++) {
  //     print("hala" + value.docs.length.toString());
  //     list.add(SectionData.fromJson(value.docs[i].data()));
  //   }
  // }).catchError((e) {
  //   print(e);
  // });
  print("hala" + list.length.toString());
  return list;
}
