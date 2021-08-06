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
    print("3333333333333333333333333333333333333333"+market.toString());
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
  print(response.body.toString());
}



//
// GFk2JhTSupYcsoTy67htuGEWM7q1
//
// Ql28hoNPyafZAR2JnZO1VkZ7mRJ2