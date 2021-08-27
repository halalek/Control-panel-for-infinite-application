import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/elements/DialogEditSectionWidget.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/repository/SectionRepository.dart' as repo;
import 'package:structurepublic/src/repository/TestRepository.dart' as repo;
import 'package:structurepublic/src/repository/TestRepository.dart';

import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PageTestController extends ControllerMVC {

  bool loading = false;
  bool done=false;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  List<ProductData> listProduct = [];
  Local bestCategorize=new Local();
  MarketData bestMarket=new MarketData();

  PageTestController() {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }


  @override
  void initState()async{
    await getAllTest();
    super.initState();
    setState((){done=true;});
  }

  getAllTest() async {
    setState((){
      listProduct.clear();
      bestCategorize=new Local();
      bestMarket=new MarketData();
    });
    await repo.getBestCategorize().then((value) {
      setState((){
        bestCategorize=value;
      });
    });
    await repo.getBestMarket().then((value) {
      setState((){
        bestMarket=value;;
      });
    });
    print("marmar"+bestMarket.id);
    print("catecate"+bestCategorize.categorizeData.id);
    await repo.getThreeBestProduct().then((value) {
      setState((){
        listProduct.addAll(value);
      });
    });
    print("product"+listProduct.length.toString());

    setState((){
      listProduct;
      bestCategorize;
      bestMarket;
    });
  }

}
