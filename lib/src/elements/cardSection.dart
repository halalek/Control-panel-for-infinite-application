import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/pages/MarketPage.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({key, this.sectionData}) : super(key: key);

  final SectionData sectionData;

  @override
  Widget build(context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: GestureDetector(
          child: Container(
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageMarket(sectionData)));
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
                      sectionData.nameAr,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(sectionData.image),
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PageMarket(sectionData)));
            // Navigator.push(context, MaterialPageRoute(builder: (context) => PageMarket() ) );
          },
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
