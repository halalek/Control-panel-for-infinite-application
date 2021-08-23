import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:structurepublic/src/controler/CategorizeController.dart';
import 'package:structurepublic/src/controler/ProductController.dart';
import 'package:structurepublic/src/elements/CategorizeCardWidget.dart';
import 'package:structurepublic/src/elements/ProductCardWidget.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/ProductData.dart';

import 'SectionPage.dart';

class Products extends StatefulWidget {
  final CategorizeData categorizeData;

  int c = 0;

  @override
  Products(
    this.categorizeData,
  );

  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Products(this.categorizeData);
  }
}

class _Products extends StateMVC<Products> {
  final CategorizeData categorizeData;
  PageProductController _con;

  _Products(this.categorizeData)
      : super(PageProductController(categorizeData)) {
    _con = controller;
  }

  PageProductController _get() {
    return _con;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(categorizeData.nameAr),
        backgroundColor: Theme.of(context).primaryColor,
      ),
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
              _con.listProduct.length,
                  (index) =>
                      CardProductWidget(categorizeData, _con.listProduct[index], _con),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[300],
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {
          setState(() async {
            ProductData newProductData = new ProductData();
            newProductData.hide = false;
            newProductData.id_categorize = categorizeData.id;
            newProductData.image = "";
            newProductData.id ="";
            newProductData.description_ar = "";
            newProductData.description_en = "";
            newProductData.nameAr = "";
            newProductData.nameEn = "";
            newProductData.note = "";
            newProductData.price = 0;
            await _con.showEditDialog(newProductData, categorizeData, _con);
          });
        },
      ),
    );
  }
}
