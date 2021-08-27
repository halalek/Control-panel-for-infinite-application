import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/controler/MarketController.dart';
import 'package:structurepublic/src/controler/workcontroller.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/WorkerData.dart';
import 'package:structurepublic/src/models/user.dart';

class CardallMarketWidget extends StatefulWidget {
  CardallMarketWidget(this.marketData, this.user);

  final WorkerData user;
  final MarketData marketData;

  workController _con;

  @override
  _CardallMarketWidgetState createState() {
    return _CardallMarketWidgetState(this.marketData, this.user);
  }
}

class _CardallMarketWidgetState extends State<CardallMarketWidget> {
  _CardallMarketWidgetState(this.marketData, this.user);

  workController _con = new workController();

  final MarketData marketData;
  final WorkerData user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 300,
          width: MediaQuery.of(context).size.width / 3,
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            List<String> t = [];
                            for (int i = 0; i < user.idMarket.length; i++) {
                              if (user.idMarket[i] != null) {
                                if (user.idMarket[i] != marketData.id) {
                                  t.add(user.idMarket[i]);
                                }
                              }
                            }
                            _con.getdeleteworker(user, t);
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                  new SizedBox(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: Image(
                        image: NetworkImage(marketData.image),
                        errorBuilder: (context, url, error) => Image.asset(
                              'assets/img/loading.gif',
                              fit: BoxFit.cover,
                            ),
                        fit: BoxFit.cover),
                  ),
                  Expanded(
                    child: ListTile(
                      tileColor: (marketData.hide == false) &&
                              (marketData.active == true)
                          ? Colors.white
                          : Colors.grey,
                      leading: CircleAvatar(
                        backgroundColor: Colors.black12,
                        backgroundImage: NetworkImage(
                          marketData.imageIcon,
                        ),
                      ),
                      title: Text(
                        marketData.nameAr,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        marketData.descriptionAr,
                      ),
                      trailing: GestureDetector(
                        child: MaterialButton(
                            onPressed: () {
                              /* pagemarketController.showEditDialog(
                                marketData, pagemarketController);*/
                            },
                            minWidth: 10,
                            height: 10,
                            child: IconButton(
                                icon: Icon(Icons.add, size: 25),
                                color: Colors.indigo,
                                onPressed: () {
                                  List<String> t = user.idMarket;

                                  t.add(marketData.id);

                                  _con.getdeleteworker(user, t);
                                })),
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             Categorize(marketData,admins)));
                        },
                      ),
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Categorize(marketData,admins)));
                      },
                    ),
                  )
                ],
              ),
              onDoubleTap: () {
                setState(() {
                  marketData;
                });
              },
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => Categorize(marketData,admins)));
              },
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
          ),
        ),
        /*  Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Switch(
                value: !marketData.hide,
                onChanged: (value) {
                  pagemarketController.hideMarket(marketData);
                },
                activeColor: Colors.lightGreen,
                activeTrackColor: Colors.white70,
              ),
            ),
          ],
        ),*/
      ],
    );
  }
}
