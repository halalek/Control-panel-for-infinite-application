import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:structurepublic/src/controler/CategorizeController.dart';
import 'package:structurepublic/src/controler/ProductController.dart';
import 'package:structurepublic/src/controler/SoldController.dart';
import 'package:structurepublic/src/elements/CategorizeCardWidget.dart';
import 'package:structurepublic/src/elements/ProductCardWidget.dart';
import 'package:structurepublic/src/elements/SoldCardWidget.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/ProductData.dart';
import 'package:structurepublic/src/models/SoldData.dart';
import 'package:structurepublic/src/models/user.dart';
import 'package:structurepublic/src/pages/DemandMarketPage.dart';

import 'CategorizePage.dart';
import 'Pagemain.dart';
import 'SectionPage.dart';
import 'TestPage.dart';
import 'mainchartspage.dart';

class Sold extends StatefulWidget {

  final MarketData marketData;
  @override
  Sold(this.marketData);

  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Sold(this.marketData);
  }
}

class _Sold extends StateMVC<Sold> {
  SoldController _con;
  final MarketData marketData;
  _Sold(this.marketData)
      : super(SoldController(marketData)) {
    _con = controller;
  }

  SoldController _get() {
    return _con;
  }

  int point=2;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.grey[100],
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(1.5),
            crossAxisCount: 2,
            childAspectRatio: 0.5,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: List.generate(
              _con.listSold.length,
                  (index) =>
                      CardSoldWidget(marketData,_con.listSold[index])
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue[900],
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                color: Colors.black12,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainchartsWidget(),
                      ),
                    );
                  },
                  minWidth: MediaQuery.of(context).size.width / 4.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
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
                  minWidth: MediaQuery.of(context).size.width / 4.5,
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
                      Icon(
                        Icons.storefront,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
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
                  minWidth: MediaQuery.of(context).size.width / 4.5,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => pagemain(),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.face,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "قائمة المستخدمين",
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
                  minWidth: MediaQuery.of(context).size.width / 4.5,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TestPage(),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.book,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10,
                      ),
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
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Image.asset("assets/img/photo1.png"),
              ),
              //SizedBox(height: 10,),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: point,
      //   selectedFontSize: 15,
      //   selectedItemColor: Theme.of(context).primaryColorDark,
      //   unselectedItemColor: Colors.black45,
      //   unselectedFontSize: 5,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.arrow_back,
      //       ),
      //       title: Text(
      //         "عودة",
      //       ),
      //       backgroundColor: Colors.white38,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.local_grocery_store,
      //       ),
      //       title: Text(
      //         " الطلبات",
      //       ),
      //       backgroundColor:Colors.white38,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.style,
      //       ),
      //       title: Text(
      //         " العروض",
      //       ),
      //       backgroundColor:Colors.white38,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.local_mall,
      //       ),
      //       title: Text(
      //         " الأصناف",
      //       ),
      //       backgroundColor:Colors.white38,
      //     ),
      //   ],
      //   onTap: (index) {
      //     setState(() {
      //         point = index;
      //         if (point == 0) {
      //           Navigator.pop(context);
      //         }
      //         if (point == 1) {
      //           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      //             return MarketDemand(admins, marketData);
      //           }));
      //         }
      //         if (point == 2) {
      //           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Sold(marketData,admins)
      //           ));
      //         }
      //         if (point == 3) {
      //           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Categorize(marketData,admins),
      //           ));
      //         }
      //     });
      //   },
      // ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[900],
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {
          setState(() async {
            SoldData newSoldData = new SoldData();
            newSoldData.hide = false;
            newSoldData.timesTamp=0;
            newSoldData.timeSend=DateTime.now().toString();
            newSoldData.image = "";
            newSoldData.imageIcon = marketData.imageIcon;
            newSoldData.longDay=0;
            newSoldData.price=0;
            newSoldData.lastPrice=0;
            newSoldData.id ="";
            newSoldData.idMarket="";
            newSoldData.descriptionAr = "";
            newSoldData.descriptionEn = "";
            newSoldData.nameAr="";
            newSoldData.nameEn="";
            newSoldData.nameMarketAr="";
            newSoldData.nameMarketEn="";
            await _con.showEditDialog(marketData, newSoldData, _con);
          });
        },
      ),
    );
  }
}
