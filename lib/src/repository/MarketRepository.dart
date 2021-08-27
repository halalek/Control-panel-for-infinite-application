import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import '../models/user.dart';
import '../helpers/custom_trace.dart';
import '../models/setting.dart';

ValueNotifier<Setting> setting = new ValueNotifier(new Setting());
final navigatorKey = GlobalKey<NavigatorState>();

Future<List<MarketData>> getMarketNode(SectionData sectionData) async {
  var url = Uri.parse('https://infinityserver2020.herokuapp.com/market/users/get/');

  http.Response res = await http.post(
    url,
    headers: <String, String>{
       'Content-Type': 'application/json; charset=UTF-8',
       'Accept':'application/json',
       'Access-Control-Allow-Origin': '*'
    },
    body:jsonEncode({"id_section":sectionData.id}),
  );
  if (res.statusCode == 200) {
    List<dynamic> body = jsonDecode(res.body);
    List<MarketData> market=[];
    market=body.map((p) => MarketData.fromJson(p)).toList();
    return market;
  } else {
    List<MarketData> market=[];
    return market;
  }
}

Future<MarketData> getmarketbyworker(String user)async{
  MarketData marketdata = new MarketData() ;

  await FirebaseFirestore.instance
      .collection("market").doc(user)//.where("id",isEqualTo:userss.id.toString()).where("role",isEqualTo:"admin")
      .get()
      .then((value) {
    marketdata=MarketData.fromJson(value.data()) ;
  }) .catchError((e){
    print(e) ;
  }) ;
  return marketdata ;
}


Future<List<MarketData>> getallmarket() async {
  //wait addtokenuser();
  List<MarketData> Worker=[];
  print("mnnnnnnnnn") ;
  await FirebaseFirestore.instance
      .collection("market").get().then((value) {
    print(value.docs.length);
    for (int i = 0; i < value.docs.length; i++) {
      Worker.add(MarketData.fromJson(value.docs[i].data()));
      print("male1111");
    }
  }
  ).catchError((e){}) ;
  print("male") ;
  print(Worker.length) ;
  print("male") ;
  return Worker  ;
}

Future<List<MarketData>> getMarketAdminNode(Userss myAdmin) async {
  var url = Uri.parse('https://infinityserver2020.herokuapp.com/market/admin/get/');
  http.Response res = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body:jsonEncode({"owners":myAdmin.id}),
  );
  if (res.statusCode == 200) {
    List<dynamic> body = jsonDecode(res.body);
    List<MarketData> market=[];
    market=body.map((p) => MarketData.fromJson(p)).toList();
    return market;
  } else {
    List<MarketData> market=[];
    return market;
  }
}

void postMarketNode(MarketData marketData,bool notification)async{
  var url = Uri.parse('https://infinityserver2020.herokuapp.com/market/');
  var response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      "description_ar":marketData.descriptionAr,
      "description_en":marketData.descriptionEn,
      "hide" : marketData.hide,
      "id":marketData.id,
      "id_section":marketData.idSection,
      "image" : marketData.image,
      "image_icon":marketData.imageIcon,
      "lat" : marketData.lat,
      "long" : marketData.long,
      "notification":notification,
      "name_ar" : marketData.nameAr,
      "name_en" : marketData.nameEn,
      "owners": marketData.owners,
      "timesTampClose" : marketData.timesTampClose,
      "timesTampOpen" : marketData.timesTampOpen,
      "rating" : marketData.rating,
      "active":marketData.active
    }),
  );
}



//
// GFk2JhTSupYcsoTy67htuGEWM7q1
//
// Ql28hoNPyafZAR2JnZO1VkZ7mRJ2