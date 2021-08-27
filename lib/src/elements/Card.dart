import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/pages/Admins.dart';

import 'package:structurepublic/src/pages/MarketPage.dart';
import 'package:structurepublic/src/pages/Users.dart';
import 'package:structurepublic/src/pages/Workers.dart';

class CardmainWidget extends StatelessWidget {
  final String name ;
  final String image ;
  final int index ;
  const CardmainWidget({key, this.name, this.image, this.index}) : super(key: key);


  @override
  Widget build(context) {
    return Container(
      height: MediaQuery.of(context).size.height/2.5,
      width: MediaQuery.of(context).size.width/3,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: GestureDetector(
          child: Container(
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  if(index==1)
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>Pageusers())) ;
                  if(index==3)
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>Pageworkers())) ;
                  if(index==2)
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>PageAdmins())) ;
                  /*  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageMarket(sectionData)));*/
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0),
                ),
                padding: EdgeInsets.all(6.0),
                color: Colors.black12,
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white70,
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.black12, //pink
                  ),
                  child: Container(
                    constraints: BoxConstraints(
                        maxWidth: 100.0, minHeight: 40.0, maxHeight: 50),
                    alignment: Alignment.center,
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(image),
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          onTap: () {
            if(index==1)
              Navigator.push(context, MaterialPageRoute(builder: (context) =>Pageusers())) ;
            if(index==3)
              Navigator.push(context, MaterialPageRoute(builder: (context) =>Pageworkers())) ;
            if(index==2)
              Navigator.push(context, MaterialPageRoute(builder: (context) =>PageAdmins())) ;
          },

          /* Navigator.push(
                context,
                MaterialPageRoute(

                   // builder: (context) => PageMarket(sectionData)));
            // Navigator.push(context, MaterialPageRoute(builder: (context) => PageMarket() ) );
          },*/
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
      ),
    );
  }
}