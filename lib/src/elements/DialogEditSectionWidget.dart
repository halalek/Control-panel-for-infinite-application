import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:structurepublic/src/controler/CategorizeController.dart';
import 'package:structurepublic/src/controler/SectionController.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/SectionData.dart';

class EditSection extends StatefulWidget {
  final SectionData sectionData;
  final PageMainController _controller;

  const EditSection(this.sectionData,this._controller);

  @override
  _EditSectionState createState() {
    return _EditSectionState(this.sectionData,this._controller);
  }
}

class _EditSectionState extends State<EditSection> {
  final SectionData sectionData;
  final PageMainController _controller;

  _EditSectionState(this.sectionData,this._controller) {
    _controller.imageUrl = sectionData.image;
    _controller.nameSectionAr.text = sectionData.nameAr;
    _controller.nameSectionEn.text = sectionData.nameEn;
  }

  final _formkey = GlobalKey<FormState>();

  bool imageError = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width/4,
        height: MediaQuery.of(context).size.height/1.3,
        child: ListView(
          children: <Widget>[
            Container(
              child: Stack(
                children: [
                  Container(
                    height: 300,
                    width: double.maxFinite,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: GestureDetector(
                        child: Expanded(
                          child: Container(
                            child: Center(
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0),
                                ),
                                padding: EdgeInsets.all(0.5),
                                color: Colors.black12,
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 100.0,
                                      minHeight: 40.0,
                                      maxHeight: 50),
                                  alignment: Alignment.center,
                                  child: Text(
                                    sectionData.nameAr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                onError: (url, error) => Image.asset(
                                  'assets/img/loading.gif',
                                  fit: BoxFit.cover,
                                ),
                                image: CachedNetworkImageProvider(
                                    _controller.imageUrl),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        margin: EdgeInsets.all(15),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              this._controller.getImage();
                            });
                          },
                          minWidth: 0.0,
                          child: Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            if (imageError)
              Center(
                child: Text(
                  "الرجاء التأكد من ادخال صورة عن الصنف",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _controller.nameSectionAr,
                      decoration: InputDecoration(
                        labelText: ' اسم القسم بالعربي',
                      ),
                      onChanged: (text) {
                        setState(() {
                          sectionData.nameAr =
                              _controller.nameSectionAr.text;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'الرجاء ادخال اسم القسم بالعربي';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _controller.nameSectionEn,
                      decoration: InputDecoration(
                        labelText: 'Section Name In English',
                      ),
                      onChanged: (text) {
                        setState(() {
                          sectionData.nameEn =
                              _controller.nameSectionEn.text;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Categorize Name In English';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 10,
                          height: 10,
                          child: Icon(
                            Icons.refresh,
                            color: Colors.red[300],
                            size: 25,
                          ),
                          onPressed: () {
                            setState(() {
                              this._controller.imageUrl;
                            });
                            // dispose();
                            // Navigator.pop(context);
                          },
                        ),
                        MaterialButton(
                          minWidth: 10,
                          height: 10,
                          child: Icon(
                            Icons.send,
                            color: Colors.indigo[500],
                            size: 30,
                          ),
                          onPressed: () async {
                            if (_controller.imageUrl.isEmpty ||
                                _controller.imageUrl == null) {
                              setState(() {
                                imageError=true;
                              });
                            }else if(_controller.imageUrl.isNotEmpty ||
                                _controller.imageUrl != null) {
                              setState(() {
                                imageError=false;
                              });

                            }
                            if (_formkey.currentState.validate() && !imageError) {
                              await _controller.editSection(sectionData);
                              dispose();
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
