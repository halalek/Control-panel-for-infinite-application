import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:structurepublic/src/controler/MarketController.dart';
import 'package:structurepublic/src/controler/allmarketcontroller.dart';
import 'package:structurepublic/src/controler/marketcontrollerbyworker.dart';
import 'package:structurepublic/src/elements/cardallmarket.dart';
import 'package:structurepublic/src/elements/cardmarketWidget.dart';
import 'package:structurepublic/src/elements/cardmarketbyworker.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/models/WorkerData.dart';
import 'package:structurepublic/src/models/user.dart';

class PageallMarket extends StatefulWidget {
  //final SectionData sectionData;

  final WorkerData user ;
  // PageMarketbyadmin(this.user, {Userss user});
  const PageallMarket({Key key, this.user}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageallMarket(this.user);
  }
}

class _PageallMarket extends StateMVC<PageallMarket> {
  //final SectionData sectionData;
  final WorkerData user ;
  allmarketController _con ;

  _PageallMarket(this.user) : super(allmarketController()) {
    _con = controller;
    //   _con2 = controller;
  }



  int point = 0;
// زبطي الشكل يا دلال خليه توووب
//   سطر مطعم صورة مطعم
//   اسطر مطاعم
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("اضافة محل",style: TextStyle(fontSize: 40),),
        backgroundColor: Theme.of(context).primaryColor,
      ),
     body: Center(
        child: Container(
          color: Colors.grey[100],
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                         for(int i=0;i<_con.listallmarket.length;i=i+3)
                           CardallMarketWidget(_con.listallmarket[i],user),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 30,),
                      /*  CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.black12,
                          backgroundImage: NetworkImage(
                            user.image,
                          ),
                        ),*/
                        SizedBox(height: 10,),
                        //Text(user.name,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(height: 10,),
                        SizedBox(
                          height: 20,
                        ),
                        if(_con.listallmarket.length>0)
                          CardallMarketWidget(_con.listallmarket[0],user),
                        for (int i = 2; i < _con.listallmarket.length; i = i + 3)
                          CardallMarketWidget(_con.listallmarket[i],user),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        for (int i = 1; i < _con.listallmarket.length; i = i + 3)
                          CardallMarketWidget(_con.listallmarket[i],user),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*void navigetor(String app) async {
    bool result =
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      //return Pagelist_detail();
    }));
  }*/
}