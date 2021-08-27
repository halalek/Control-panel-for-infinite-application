import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/controler/admincontroller.dart';

import 'package:structurepublic/src/controler/usercontroller.dart';
import 'package:structurepublic/src/elements/cardadmin.dart';
import 'package:structurepublic/src/elements/cardus.dart';
import 'package:structurepublic/src/pages/signupView.dart';


class PageAdmins extends StatefulWidget
{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageAdmins();
  }
}

class  _PageAdmins extends StateMVC<PageAdmins> {
  AdminController _con2;

  _PageAdmins() : super(AdminController()) {
    _con2 = controller;
    print("kkkkkkk") ;
  }

  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("الادمن",style: TextStyle(fontSize: 40),),
        backgroundColor: Theme
            .of(context)
            .primaryColor,

      ),
      floatingActionButton: FloatingActionButton(
          child:Icon(Icons.add),
          onPressed: () {
            int v=1;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SignupMain(v:1),
              ),
            );

          }
      ),


      body:Center(
      child:Container(
        width: MediaQuery.of(context).size.width*(2/3),
    child:  ListView.builder(
        // shrinkWrap: true,
        itemCount:_con2.listAdmin.length,

        itemBuilder: (context, i) {
          print(";;;;;;;;;;;;;;;;;;;;;;;;sggggggah") ;

          print("heeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffff") ;
          return Cardadmin(user:_con2.listAdmin[i]);
        },
      ),
      ),
      ),
    );
  }
}