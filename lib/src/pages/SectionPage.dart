import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:structurepublic/src/controler/SectionController.dart';
import 'package:structurepublic/src/controler/user_controller.dart';
import 'package:structurepublic/src/elements/cardSection.dart';

class PageMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageMain();
  }
}

class _PageMain extends StateMVC<PageMain> {
  int point = 0;
  PageMainController _con;

  _PageMain() : super(PageMainController()) {
    // _con = controller;
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.grey[100],
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(1.5),
            crossAxisCount: 2,
            childAspectRatio: 0.98,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: List.generate(
              _con.listSection.length,
              (index) => CardWidget(
                sectionData: _con.listSection[index],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: point,
        selectedFontSize: 15,
        selectedItemColor: Theme.of(context).primaryColorDark,
        unselectedItemColor: Colors.black45,
        unselectedFontSize: 13,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.storefront_outlined,
              //  color: Colors.black45,
            ),
            title: Text(
              "المحلات",
              //  style: TextStyle(color: Colors.black45),
            ),
            // backgroundColor:Colors.white38,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.face,
              //color: Colors.black45,
            ),
            title: Text(
              "المستخدمين",
              // style: TextStyle(color: Colors.black45),
            ),
            //  backgroundColor:Colors.white38,
          )
        ],
        onTap: (index) {
          setState(() {
            point = index;

            if (point == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => PageMain(),
                ),
              );
            }
            if (point == 1) {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => PageSold(),
              //   ),
              // );
            }
          });
        },
      ),
    );
    // TODO: implement build
  }
}
