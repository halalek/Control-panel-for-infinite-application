import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/elements/Card.dart';
import 'package:structurepublic/src/elements/cardus.dart';


class pagemain extends StatefulWidget {
  @override
  _pagemainState createState() => _pagemainState();
}

class _pagemainState extends StateMVC<pagemain> {
  List<String>listnames=['USERS','ADMINS','WORKERS'] ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text("عناصر الرئيسية",style: TextStyle(fontSize: 40),),
    backgroundColor: Theme.of(context).primaryColor,

    ),
      body:Center(
     child: Container(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                CardmainWidget (name:"مستخدمون",image:"assets/img/user.png",index: 1),
                CardmainWidget(name:"أدمنات",image:"assets/img/Admin.png",index: 2),
        ],
            ),
         Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             CardmainWidget (name:"عاملون",image:"assets/img/worker.png",index: 3),
           ],
         ),
    ),

],
    ),
    ),
      ),
    ) ;
    }

  }

