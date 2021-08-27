import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/helpers/helper.dart';
import 'package:structurepublic/src/models/user.dart';
import 'package:structurepublic/src/repository/repouser.dart';
import 'package:structurepublic/src/repository/repouser.dart'as repo;
class UserController extends ControllerMVC{
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
List<Userss>listuser=[] ;
  UserController() {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();}
    @override
    void initState() {
      print("8888888888888888888888888888" ) ;
      getlistuser() ;
      super.initState();
      print("8888888888888888888888888888" ) ;
      //getlistuser() ;
    }
Container localcontainer=new Container(

  decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    color: Colors.grey[100],
  ),

) ;
  void getlistuser() async {

    print("999999999999999999" ) ;
    await repo.getUser().then((value){
      setState(() {
        listuser.addAll(value);
      }) ;

     print("beforrrrrrrrrrrrrrrrrrrrrrrrrrr") ;
      print(listuser.length) ;
      });

  }

}