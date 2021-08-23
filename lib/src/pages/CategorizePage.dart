import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:structurepublic/src/controler/CategorizeController.dart';
import 'package:structurepublic/src/elements/CategorizeCardWidget.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/user.dart';
import 'package:structurepublic/src/pages/DemandMarketPage.dart';
import 'package:structurepublic/src/pages/Sold.dart';

import 'SectionPage.dart';
// ignore: must_be_immutable
class Categorize extends StatefulWidget {
  final MarketData marketData;
  Categorize(this.marketData);

  int c = 0;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Categorize(this.marketData);
  }
}

class _Categorize extends StateMVC<Categorize> {
  final MarketData marketData;
  CategorizeData categorizeData;

  PageCategorizeController _categorizeController;

  _Categorize(this.marketData)
      : super(
          PageCategorizeController(marketData),
        ) {
    _categorizeController = controller;
    //_con= _categorizeDetail._get();

    //_con=controller;
  }

  bool select = false;
  int point = 3;
  int pointt = 0;
  int z = 0;

  // _ProductDetail(this.pointt);
  Decoration _decoration1 = BoxDecoration(
    color: Colors.black12,
  );
  Decoration _decoration = BoxDecoration(
    color: Colors.white24,
    border: Border(
      bottom: BorderSide(width: 1),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(shrinkWrap: true, children: [
        Container(
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              Container(
                height: 130,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "البحث ....",
                    icon: Icon(Icons.search),
                  ),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(marketData.image),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Row(
                //demand and sold....................
                children: [

                ],
              ),
              Expanded(
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(1.5),
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      _categorizeController.listCategorize.length,
                          (index) => CardCategorizeWidget(
                          _categorizeController.listCategorize[index],
                          _categorizeController,
                          marketData),
                    ),
                  )),
            ])),
      ]),
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
                color: Colors.black38,
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
      floatingActionButton:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 10,),
          FloatingActionButton(
            backgroundColor: Colors.blue[200],
            foregroundColor: Colors.white,
            child: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MarketDemand(marketData),
                ),
              );
            },
          ),
          SizedBox(height: 10,),
          FloatingActionButton(
            backgroundColor: Colors.blue[200],
            foregroundColor: Colors.white,
            child: Icon(Icons.style),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Sold(marketData),
                ),
              );
            },
          ),
          SizedBox(height: 10,),
          FloatingActionButton(
            backgroundColor: Colors.blue[200],
            foregroundColor: Colors.white,
            child: Icon(Icons.add),
            onPressed: () {
              setState(() async {
                CategorizeData newcategorize = new CategorizeData();
                newcategorize.hide = false;
                newcategorize.image = "";
                newcategorize.id = "";
                newcategorize.nameAr = "";
                newcategorize.nameEn = "";
                await _categorizeController.showEditDialog(
                    marketData, newcategorize, _categorizeController);
                //_con.listProduct.add(newProductData);
              });
            },
          ),
          SizedBox(height: 10,),
        ],
      )
    );
  }
}
