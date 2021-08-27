import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/helpers/helper.dart';
import 'package:structurepublic/src/models/user.dart';
import 'package:structurepublic/src/repository/repouser.dart';
import 'package:structurepublic/src/repository/repouser.dart'as repo;
class AdminController extends ControllerMVC{
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  List<Userss>listAdmin=[] ;
  AdminController() {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();}
  @override
  void initState() {
    print("8888888888888888888888888888" ) ;
    getlistAdmin() ;
    super.initState();
    print("8888888888888888888888888888" ) ;
    //getlistuser() ;
  }

  void getlistAdmin() async {

    print("999999999999999999" ) ;
    await repo.getAdmin().then((value){
      setState(() {
        listAdmin.addAll(value);
      }) ;

      print("beforrrrrrrrrrrrrrrrrrrrrrrrrrr") ;
      print(listAdmin.length) ;
    });

  }



}