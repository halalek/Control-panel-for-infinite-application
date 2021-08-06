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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView.builder(
          itemCount: _con2.listMarket.length,
          itemBuilder: (context, i) {
            return CardMarketWidget(_con2.listMarket[i], _con2);
          },
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
