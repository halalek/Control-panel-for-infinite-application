import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/controler/TestController.dart';
import 'package:structurepublic/src/elements/CircularLoadingWidget.dart';

import 'SectionPage.dart';

class TestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TestPage();
  }
}

class _TestPage extends StateMVC<TestPage> {
  int point = 1;
  PageTestController _con;

  _TestPage() : super(PageTestController()) {
    // _con = controller;
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            if (!_con.done)
              CircularLoadingWidget(
                height: 10,
              ),
            if (_con.done)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "الصنف الحاوي على أكبر عدد من النتجات وهو تابع ل \t",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          _con.bestCategorize.marketData.nameAr +
                              "\t:\t" +
                              _con.bestCategorize.marketData.descriptionAr,
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Stack(
                            children: [
                              Container(
                                height: 300,
                                width: MediaQuery.of(context).size.width / 3,
                                child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: GestureDetector(
                                    child: Expanded(
                                      child: Container(
                                        child: Center(
                                          child: MaterialButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(80.0),
                                            ),
                                            padding: EdgeInsets.all(0.5),
                                            color: Colors.black12,
                                            child: Container(
                                              color: Colors.black12,
                                              constraints: BoxConstraints(
                                                  maxWidth: 100.0,
                                                  minHeight: 40.0,
                                                  maxHeight: 50),
                                              alignment: Alignment.center,
                                              child: Text(
                                                _con.bestCategorize
                                                    .categorizeData.nameAr,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            onError: (url, error) =>
                                                Image.asset(
                                              'assets/img/loading.gif',
                                              fit: BoxFit.cover,
                                            ),
                                            image: CachedNetworkImageProvider(
                                                _con.bestCategorize
                                                    .categorizeData.image),
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "المتجر صاحب أكبر عدد من العروض",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width / 3,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: GestureDetector(
                              child: Column(
                                children: <Widget>[
                                  new SizedBox(
                                    height: 200,
                                    width: MediaQuery.of(context).size.width,
                                    child: Image(
                                        errorBuilder: (context, url, error) =>
                                            Image.asset(
                                              'assets/img/loading.gif',
                                              fit: BoxFit.cover,
                                            ),
                                        image:
                                            NetworkImage(_con.bestMarket.image),
                                        fit: BoxFit.cover),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      tileColor: _con.bestMarket.hide == false
                                          ? Colors.white
                                          : Colors.grey,
                                      leading: CircleAvatar(
                                        child: MaterialButton(
                                          minWidth: 0.0,
                                        ),
                                        backgroundColor: Colors.black12,
                                        backgroundImage: NetworkImage(
                                          _con.bestMarket.imageIcon,
                                        ),
                                      ),
                                      title: Text(
                                        _con.bestMarket.nameAr,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      //subtitle: Text(marketController.locationMarket.toString()),
                                      subtitle: Text(
                                        _con.bestMarket.descriptionAr,
                                      ),
                                      onTap: () {},
                                    ),
                                  )
                                ],
                              ),
                              onTap: () {},
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            SizedBox(
              height: 70,
            ),
            if (_con.done)
              Row(
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "أكثر ثلاث منتجات طلباً من المستخدمين",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (int i = 0; i < _con.listProduct.length; i++)
                              Container(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding:
                                                EdgeInsets.fromLTRB(7, 7, 7, 0),
                                            height: 210,
                                            width: double.maxFinite,
                                            child: Card(
                                              elevation: 5,
                                              //  color: Colors.orange,
                                              semanticContainer: true,
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              child: Column(
                                                children: [
                                                  new SizedBox(
                                                    height: 130,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    // child:Image.network('https://dbq8hrmshvuto.cloudfront.net/a2d/f98c8/0803/4c93/9ebe/05596a8ed7a9/normal/516995.jpg',fit: BoxFit.cover,),
                                                    child: Image(
                                                      errorBuilder: (context,
                                                              url, error) =>
                                                          Image.asset(
                                                        'assets/img/loading.gif',
                                                        fit: BoxFit.cover,
                                                      ),
                                                      image:
                                                          CachedNetworkImageProvider(
                                                        _con.listProduct[i]
                                                            .image,
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: ListTile(
                                                      tileColor:
                                                          _con.listProduct[i]
                                                                      .hide ==
                                                                  false
                                                              ? Colors.white
                                                              : Colors.grey,
                                                      //   leading: CircleAvatar(backgroundColor: Colors.black12,backgroundImage:NetworkImage('https://arab-rate.com/media/reviews/photos/original/cd/77/3e/309-309-79-1578342205.jpg',),),
                                                      title: Text(
                                                        _con.listProduct[i]
                                                            .nameAr,
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      subtitle: Text(
                                                        _con.listProduct[i]
                                                                .description_ar ??
                                                            " ",
                                                      ),

                                                      trailing: Container(
                                                        child: Text(
                                                          _con.listProduct[i]
                                                              .price
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
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
                color: Colors.black38,
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
                  onPressed: () {},
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
    );
    // TODO: implement build
  }
}
