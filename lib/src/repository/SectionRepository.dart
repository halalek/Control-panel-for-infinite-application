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



Future<List<SectionData>> getSections1() async {
  List<SectionData> list = [];

  await FirebaseFirestore.instance.collection('section').get().then((value) {
    for (int i = 0; i < value.docs.length; i++) {
      print( value.docs.length.toString());
      list.add(SectionData.fromJson(value.docs[i].data()));
    }
  }).catchError((e) {
    print(e);
  });
  print("sec");
  print( list[1].nameAr);
  return list;
}

Future<int> getSections2(SectionData s) async {

  int u=0;

  await FirebaseFirestore.instance.collection("market").where("id_section",isEqualTo:s.id.toString() ).get().then((value){

    u= value.docs.length;
  }).catchError((e) {
    print(e);
  });

  return u;


}

Future<List<SectionData>> getSections() async {
  List<SectionData> list = [];


  // await FirebaseFirestore.instance
  //     .collection('section')
  //     .get()
  //     .then((QuerySnapshot querySnapshot) {
  //   querySnapshot.docs.forEach((doc) {
  //     list.add(SectionData.fromJson(doc.data()));
  //     print(doc["id"]);
  //   });
  // });


  await FirebaseFirestore.instance.collection('section').get().then((value) {
    for (int i = 0; i < value.docs.length; i++) {
      print("hala" + value.docs.length.toString());
      list.add(SectionData.fromJson(value.docs[i].data()));
    }
  }).catchError((e) {
    print(e);
  });
  print("hala" + list.length.toString());
  return list;
}


Future<List<SectionData>> getSectionNode() async {
  var url = Uri.parse('https://infinityserver2020.herokuapp.com/section/get/');

  http.Response res = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (res.statusCode == 200) {
    List<dynamic> body = jsonDecode(res.body);
    List<SectionData> section=[];
    section=body.map((p) => SectionData.fromJson(p)).toList();
    return section;
  } else {
    List<SectionData> section=[];
    return section;
  }
}



void postSectionNode(SectionData sectionData)async{
  var url = Uri.parse('https://infinityserver2020.herokuapp.com/section/');
  var response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      "hide" : sectionData.hide,
      "id" : sectionData.id,
      "image" : sectionData.image,
      "name_ar" : sectionData.nameAr,
      "name_en" : sectionData.nameEn,
      "timesTamp":sectionData.timesTamp
    }),
  );
  print(response.body.toString());
}