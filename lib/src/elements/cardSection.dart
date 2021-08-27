import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:structurepublic/src/controler/SectionController.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/pages/MarketPage.dart';


class CardWidget extends StatefulWidget {
  const CardWidget( this.sectionData,this._con);

  final SectionData sectionData;
  final PageMainController _con;


  @override
  _CardWidgetState createState() => _CardWidgetState(this.sectionData,this._con);
}

class _CardWidgetState extends State<CardWidget> {
  final SectionData sectionData;
  final PageMainController _con;

  _CardWidgetState(this.sectionData, this._con);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: GestureDetector(
          child: Column(children: [
            Container(
              color:
              sectionData.hide == false ? Colors.white : Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Switch(
                    value: !sectionData.hide,
                    onChanged: (value) {
                      _con.hideSection(sectionData);
                    },
                    activeColor: Colors.blue[900],
                    activeTrackColor: Colors.white70,
                  ),
                ],
              ),
            ),
            Container(
              height: 280,
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
                      height: 50,
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
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              color:
              sectionData.hide == false ? Colors.white : Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 10,
                    height: 10,
                    child: Icon(
                      Icons.edit_outlined,
                      color: Colors.blue[900],
                      size: 25,
                    ),
                    onPressed: () {
                      _con.showEditDialog(sectionData,_con);
                    },
                  ),
                ],
              ),
            ),
          ],
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
