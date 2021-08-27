import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:structurepublic/src/controler/MarketController.dart';
import 'package:structurepublic/src/elements/cardmarketWidget.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/models/user.dart';

import 'SectionPage.dart';

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
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black12,
                    backgroundImage: NetworkImage(
                      sectionData.image,
                    ),
                  ),
              ],),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(sectionData.nameAr,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
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
                        SizedBox(
                          height: 20,
                        ),
                        for (int i = 1; i < _con2.listMarket.length; i = i + 3)
                          CardMarketWidget(_con2.listMarket[i], _con2),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        for (int i = 2; i < _con2.listMarket.length; i = i + 3)
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {
          setState(() async {
            MarketData newMarket = new MarketData();
            newMarket.hide = false;
            newMarket.image = "";
            newMarket.id = Uuid().generateV4();
            newMarket.nameAr = "";
            newMarket.nameEn = "";
            newMarket.long=0.0;
            newMarket.lat=0.0;
            newMarket.active=true;
            newMarket.descriptionAr="";
            newMarket.imageIcon="";
            newMarket.descriptionEn="";
            newMarket.owners=[];
            newMarket.idSection=sectionData.id;
            newMarket.timesTampClose=0;
            newMarket.timesTampOpen=0;
            newMarket.rating=0;
            await _con2.showEditDialog(newMarket, _con2);
            //_con.listProduct.add(newProductData);
          });
        },
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue[900],
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                color: Colors.black12,
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: MediaQuery
                      .of(context)
                      .size
                      .width / 4.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home, size: 30, color: Colors.white,),
                      SizedBox(height: 10,),
                      Text(
                        "الصفحة الرئيسية",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12.5,
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 12.5,
              ),
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                color: Colors.black12,
                child: MaterialButton(
                  minWidth: MediaQuery
                      .of(context)
                      .size
                      .width / 4.5,
                  //color: Colors.black12,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageMain(),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.storefront, size: 30, color: Colors.white
                        ,),
                      SizedBox(height: 10,),
                      Text(
                        "إدارة المتاجر",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12.5,
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 12.5,
              ),
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                color: Colors.black12,
                child: MaterialButton(
                  minWidth: MediaQuery
                      .of(context)
                      .size
                      .width / 4.5,
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.face, size: 30, color: Colors.white,),
                      SizedBox(height: 10,),
                      Text(
                        "قائمة المستخدمين",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),),
              SizedBox(
                height: 12.5,
              ),
              Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 12.5,
              ),
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                color: Colors.black12,
                child: MaterialButton(
                  minWidth: MediaQuery
                      .of(context)
                      .size
                      .width / 4.5,
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.book, size: 30, color: Colors.white,),
                      SizedBox(height: 10,),
                      Text(
                        "التقارير ",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(5),
                child:  Image.asset("assets/img/photo1.png"),
              ),
              //SizedBox(height: 10,),
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
