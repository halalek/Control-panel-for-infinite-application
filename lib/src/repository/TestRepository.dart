import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
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
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/DemandData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import '../models/user.dart';
import '../helpers/custom_trace.dart';
import '../models/setting.dart';



Future<MarketData> getBestMarket()async{
  MarketData bestMarketData=new MarketData();
  int topSold=0;
  await FirebaseFirestore.instance.collection('market').get().then((valueMarket) async {
    for (int i = 0; i < valueMarket.docs.length; i++) {
      await FirebaseFirestore.instance.collection('sold').where("id_market", isEqualTo: MarketData.fromJson(valueMarket.docs[i].data()).id).get().then((valueSold) {
        if(valueSold.docs.length >= topSold){
          topSold=valueSold.docs.length;
          bestMarketData=MarketData.fromJson(valueMarket.docs[i].data());
        }
      }).catchError((e) {
        print(e);
      });
    }
  }).catchError((e) {
    print(e);
  });
  return bestMarketData;
}

class Temp{
  int index;
  int number;
  Temp({this.index,this.number});
}

Future<List<ProductData>> getThreeBestProduct()async{
  List<ProductData> list=[];
  List<Temp> number=[];
  await FirebaseFirestore.instance.collection('product').get().then((valueProduct) async {
    for (int i = 0; i < valueProduct.docs.length; i++) {
      ProductData localProduct=new ProductData.fromJson(valueProduct.docs[i].data());
      int localNumber=0;
      await FirebaseFirestore.instance.collection('demand').get().then((valueDemand) {
        for(int j=0;j<valueDemand.docs.length;j++){
          DemandData localDemand=new DemandData.fromJson(valueDemand.docs[j].data());
          for(int k=0;k<localDemand.product.length;k++){
            if(localDemand.product[k].id == localProduct.id){
              localNumber++;
            }
          }
        }
      }).catchError((e) {
        print(e);
      });
      list.add(localProduct);
      number.add(Temp(index: i,number: localNumber));
    }
  }).catchError((e) {
    print(e);
  });

  number.sort((a,b){
    return a.number.compareTo(b.number);
  });

  List<ProductData> endProduct=[];
  if(list.length>=1){
    endProduct.add(list[0]);
  }if(list.length>=2){
    endProduct.add(list[1]);
  }if(list.length>=3){
    endProduct.add(list[2]);
  }

  return endProduct;
}

class Local{
  CategorizeData categorizeData;
  MarketData marketData;
  Local({this.categorizeData,this.marketData});
}

Future<Local> getBestCategorize()async{
  Local bestCategorize=new Local();
  int topProduct=0;
  await FirebaseFirestore.instance.collection('market').get().then((valueMarket) async {
    for (int i = 0; i < valueMarket.docs.length; i++) {
      MarketData localMarket=MarketData.fromJson(valueMarket.docs[i].data());
      await FirebaseFirestore.instance.collection('market').doc(localMarket.id).collection("categorize").get().then((valueCategorize) async{
        for(int j=0;j<valueCategorize.docs.length;j++){
          CategorizeData localCategorize=CategorizeData.fromJson(valueCategorize.docs[j].data());
          await FirebaseFirestore.instance.collection('product').where("id_categorize",isEqualTo: localCategorize.id).get().then((valueProduct) {
            if(valueProduct.docs.length>=topProduct){
              topProduct=valueProduct.docs.length;
              bestCategorize=Local(categorizeData: localCategorize,marketData: localMarket);
            }
          }).catchError((e) {
            print(e);
          });
        }
      }).catchError((e) {
        print(e);
      });
    }
  }).catchError((e) {
    print(e);
  });
  return bestCategorize;
}

Future<int> getTotalSell(MarketData marketData,int start,int end,bool allTime)async{
  int totalSell=0;
  await FirebaseFirestore.instance.collection('myDemand').where("id_market",isEqualTo: marketData.id).get().then((valueDemand) async {
   for(int i=0;i<valueDemand.docs.length;i++){
     DemandData localDemand=DemandData.fromJson(valueDemand.docs[i].data());
     if((localDemand.remove==false)&&(localDemand.stateEn=="Delivered ...")){
       if(allTime){
         totalSell=totalSell+localDemand.priceTotal;
       }else{
         if((DateTime.fromMicrosecondsSinceEpoch(start).isBefore(DateTime.fromMicrosecondsSinceEpoch(localDemand.timesTampCreat)))&&(DateTime.fromMicrosecondsSinceEpoch(end).isAfter(DateTime.fromMicrosecondsSinceEpoch(localDemand.timesTampCreat))) ){
           totalSell=totalSell+localDemand.priceTotal;
         }
       }
     }
   }
  }).catchError((e) {
    print(e);
  });
  return totalSell;
}