import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/helpers/helper.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/WorkerData.dart';
import 'package:structurepublic/src/models/user.dart';
import 'package:structurepublic/src/repository/repouser.dart';
import 'package:structurepublic/src/repository/MarketRepository.dart' as repo;
class allmarketController extends ControllerMVC{
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  List<MarketData>listallmarket=[] ;
  allmarketController() {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();}
  @override
  void initState() {
    print("8888888888888888888888888888" ) ;
    getlistallmarket() ;
    super.initState();
    print("8888888888888888888888888888" ) ;
    //getlistuser() ;
  }



  void getlistallmarket() async {

    print("999999999999999999" ) ;
    await repo.getallmarket().then((value){
      setState(() {
        listallmarket.addAll(value);
      }) ;

      print("beforrrrrrrrrrrrrrrrrrrrrrrrrrr") ;
      print(listallmarket.length) ;
    });

  }

}