import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:structurepublic/src/controler/MarketController.dart';
import 'package:structurepublic/src/controler/marketcontrollerbyworker.dart';
import 'package:structurepublic/src/elements/cardmarketWidget.dart';
import 'package:structurepublic/src/elements/cardmarketbyworker.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/models/WorkerData.dart';
import 'package:structurepublic/src/models/user.dart';
import 'package:structurepublic/src/pages/pageallmarket.dart';

class PageMarketbyworker extends StatefulWidget {
  //final SectionData sectionData;

  final WorkerData user ;
  // PageMarketbyadmin(this.user, {Userss user});
  const PageMarketbyworker({Key key, this.user}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageMarketworker(this.user);
  }
}

class _PageMarketworker extends StateMVC<PageMarketbyworker> {
  //final SectionData sectionData;
  final WorkerData user ;
  workermarketController _con ;

   _PageMarketworker(this.user) : super(workermarketController(user)) {
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
        title: Text("محلات عامل توصيل",style: TextStyle(fontSize: 40),),
        backgroundColor: Theme.of(context).primaryColor,
      ),


      floatingActionButton: FloatingActionButton(
          child:Icon(Icons.add),

          onPressed: () {

           Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => PageallMarket(user:user),
              ),
            );

          }
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
                       // for(int i=0;i<user.idMarket.length;i=i+3)
                         // CardMarketbyworkerWidget(user.idMarket[i]),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 30,),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.black12,
                          backgroundImage: NetworkImage(
                            user.image,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(user.name,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(height: 10,),
                        SizedBox(
                          height: 20,
                        ),
                      if(_con.listmarketbyworker.length>0)
                          CardMarketbyworkerWidget(_con.listmarketbyworker[0]),
                        for (int i = 2; i < _con.listmarketbyworker.length; i = i + 3)
                         CardMarketbyworkerWidget(_con.listmarketbyworker[i]),
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
                       for (int i = 1; i < _con.listmarketbyworker.length; i = i + 3)
                        CardMarketbyworkerWidget(_con.listmarketbyworker[i]),
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

  void navigetor(String app) async {
    bool result =
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      //return Pagelist_detail();
    }));
  }
}