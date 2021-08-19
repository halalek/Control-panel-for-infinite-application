import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:structurepublic/src/controler/MarketController.dart';
import 'package:structurepublic/src/elements/cardmarketWidget.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/models/user.dart';

class PageMarket extends StatefulWidget {
  //final SectionData sectionData;
  final SectionData sectionData;

  PageMarket(this.sectionData);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageMarket(this.sectionData);
  }
}

class _PageMarket extends StateMVC<PageMarket> {
  //final SectionData sectionData;
  final SectionData sectionData;
  PageMarketController _con2;

  // _PageMarket(this.sectionData) : super(PageMarketController(sectionData)) {
  //   // _con = controller;
  //   _con2 = controller;
  // }

  _PageMarket(this.sectionData) : super(PageMarketController(sectionData)) {
    // _con = controller;
    _con2 = controller;
  }

  int point = 0;
// زبطي الشكل يا دلال خليه توووب
//   سطر مطعم صورة مطعم
//   اسطر مطاعم
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
                        for(int i=0;i<_con2.listMarket.length;i=i+3)
                        CardMarketWidget(_con2.listMarket[i], _con2),
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
                            sectionData.image,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(sectionData.nameAr,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(height: 10,),
                        SizedBox(
                          height: 20,
                        ),
                        if(_con2.listMarket.length>0)
                          CardMarketWidget(_con2.listMarket[0], _con2),
                        for (int i = 2; i < _con2.listMarket.length; i = i + 3)
                          CardMarketWidget(_con2.listMarket[i], _con2),
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
                        for (int i = 1; i < _con2.listMarket.length; i = i + 3)
                          CardMarketWidget(_con2.listMarket[i], _con2),
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
