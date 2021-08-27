import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/helpers/helper.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/WorkerData.dart';
import 'package:structurepublic/src/models/user.dart';
import 'package:structurepublic/src/repository/repouser.dart';

import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/elements/DialogEditMarketWidget.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/repository/MarketRepository.dart' as repo;
//import 'package:structurepublic/src/repository/ProductRepository.dart' as repo;

import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';



class workermarketController extends ControllerMVC{
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
final  WorkerData user ;
  List<MarketData>listmarketbyworker=[] ;
  workermarketController(this.user) {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();}
  @override
  void initState() {
    print("8888888888888888888888888888" ) ;
    getlistmarketbyworker() ;
    super.initState();
    print("8888888888888888888888888888" ) ;
    //getlistuser() ;
  }

  void getlistmarketbyworker() async {
    setState(() {
      listmarketbyworker.clear();
    });
    print("999999999999999999" ) ;
    for(int i=0 ;i<user.idMarket.length ;i++)
        await repo.getmarketbyworker(user.idMarket[i]).then((value){
      setState(() {
        listmarketbyworker.add(value);
      }) ;

      print("beforrrrrrrrrrrrrrrrrrrrrrrrrrr") ;
      print(listmarketbyworker.length) ;
    });

  }

}