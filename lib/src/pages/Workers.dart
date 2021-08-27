import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'package:structurepublic/src/controler/usercontroller.dart';
import 'package:structurepublic/src/controler/workcontroller.dart';

import 'package:structurepublic/src/elements/cardworker.dart';

import 'package:structurepublic/src/pages/signupView.dart';

import 'Signviewworker.dart';

class Pageworkers extends StatefulWidget
{
  workController _con2;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Pageworkers();
  }
}

class  _Pageworkers extends StateMVC<Pageworkers> {
  workController _con2;
  _Pageworkers() : super( workController()) {
    _con2 = controller;
    print(_con2.listwork.length) ;
  }
  workController _get() {
    return _con2;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
         title: Text("العمال",style:TextStyle(fontSize: 40) ,),
          backgroundColor: Theme
              .of(context)
              .primaryColor,

        ),
      floatingActionButton: FloatingActionButton(
          child:Icon(Icons.add),
          onPressed: () {
           Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SignupworkerMain(),
              ),
            );

          }
      ),
   body:Center(
   child:Container(
     width: MediaQuery.of(context).size.width*(2/3),
   child:ListView.builder(
     // shrinkWrap: true,
      itemCount:_con2.listwork.length,

      itemBuilder: (context, i) {
        print("lllll") ;
        print(_con2.listwork.length) ;
        print("heeeeeeeeeeeeeeeeeeeeeffffffffffffffffffffffffff") ;
        return Cardwork(user:_con2.listwork[i]);
      },
    ),
   ),
   ),
    );
  }
}