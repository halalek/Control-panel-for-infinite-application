//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'package:structurepublic/src/controler/usercontroller.dart';
import 'package:structurepublic/src/elements/cardus.dart';
import 'package:structurepublic/src/pages/signupView.dart';

import 'Pagemain.dart';



class Pageusers extends StatefulWidget
{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Pageusers();
  }
}

class  _Pageusers extends StateMVC<Pageusers> {
  UserController _con2;

  _Pageusers() : super(UserController()) {
    _con2 = controller;
    print("kkkkkkk") ;
  }

  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

        appBar: AppBar(

          title: Text("مستخدمون",style: TextStyle(fontSize: 40),),
          //titleTextStyle:
          backgroundColor: Theme
              .of(context)
              .primaryColor,

        ),
floatingActionButton: FloatingActionButton(
  child:Icon(Icons.add),

  onPressed: () {
    int v=0 ;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignupMain(v:0),
      ),
    );

  }
),

      body:Center(
    child:  Container(
       // height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width*(2/3),
    // alignment: Alignment.center,
     child:ListView.builder(
      // shrinkWrap: true,
      itemCount:_con2.listuser.length,

      itemBuilder: (context, i) {
        print(";;;;;;;;;;;;;;;;;;;;;;;;sggggggah") ;
        print(_con2.listuser.length) ;
        print("heeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffff") ;
        return Carduser(user:_con2.listuser[i]);
      },
    ),
      ),
      ),
    );
  }
}