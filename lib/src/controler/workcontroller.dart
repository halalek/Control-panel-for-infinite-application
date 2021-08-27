import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/helpers/helper.dart';
import 'package:structurepublic/src/models/WorkerData.dart';
import 'package:structurepublic/src/models/user.dart';
import 'package:structurepublic/src/repository/repouser.dart';
import 'package:structurepublic/src/repository/repouser.dart'as repo;
class workController extends ControllerMVC{
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  List<WorkerData>listwork=[] ;

  workController() {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();}
  @override
  void initState() {
    print("8888888888888888888888888888" ) ;

    super.initState();
    print("8888888888888888888888888888" ) ;
    getlistwork() ;
    print(listwork.length) ;
  }
Future<void> getdeleteworker(WorkerData user,List<String>idmarket) async {
  await repo.deletworker(user, idmarket).then((value){print("done worker deleye");
  }).catchError((e){print(e);});

      }
  Future<void> addmarketworker(WorkerData user,List<String>idmarket) async {
    await repo.addworker(user, idmarket).then((value){print("done add ma wo");
    }).catchError((e){print(e);});

  }


  void getlistwork() async {
    setState(() {
      listwork.clear();

    });
    print("999999999999999999" ) ;
    // value.forEach(()async  {
    await repo.getworker().then((value){

        print("999999999999999999" ) ;
        setState(() {
          listwork.addAll(value);
        }) ;


    //  });
      print("beforrrrrrrrrrrrrrrrrrrrrrrrrrr") ;
      print(listwork.length) ;
    });

  }



}