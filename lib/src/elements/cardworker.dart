/*import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:structurepublic/src/models/WorkerData.dart';
import 'package:structurepublic/src/models/user.dart';


class Cardwork extends StatelessWidget {
  final WorkerData Worker ;
  Cardwork( {Key key, this.Worker}) : super(key: key);

  // PageMarketController ggg=new  PageMarketController();

  @override
  Widget build(BuildContext context) {
return GestureDetector(child:Row(
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.fromLTRB(7,7,7,0),
            height: 100,
            width: double.maxFinite,
            child: Card(
                elevation: 5,
                //  color: Colors.orange,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child:Column(children: [


                  Expanded(child: ListTile(
                    leading: CircleAvatar(backgroundColor: Colors.black12,backgroundImage:CachedNetworkImageProvider(Worker.image)),
                    title: Text(Worker.name,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                    subtitle: Text(Worker.phone.toString() ??  ""),

                    trailing:
                    GestureDetector(
                      //child: Text("llll",style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.w400),),
                       child:Icon(Icons.mode_rounded, color: Colors.grey,),
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetail(productData,categorizeData)) );

                      },),
                    onTap: () {
                      //  Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetail(productData,categorizeData)) );

                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),)


                ],

                )

            ) ,


          )
          ),

        ]
    ),
      onTap: (){
        //  Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetail(productData,categorizeData)) );

        // navigetor("");
      },
    ) ;
  }
}*/

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:structurepublic/src/models/WorkerData.dart';
import 'package:structurepublic/src/models/user.dart';
import 'package:structurepublic/src/pages/Editprofile.dart';
import 'package:structurepublic/src/pages/Editprofileworker.dart';
import 'package:structurepublic/src/pages/pagemarketbyworker.dart';


class Cardwork extends StatefulWidget {

  final WorkerData user ;


  const Cardwork({Key key, this.user}) : super(key: key);
  @override
  _CardworkState createState() => _CardworkState(this.user);
}

class _CardworkState extends State<Cardwork> {
  _CardworkState(this.user);

  void updataName(String name){
    setState(() =>_name = name);

  }
  void moveToSecondPage() async {
    final information = await Navigator.push(
      context,
      CupertinoPageRoute(
          fullscreenDialog: true, builder: (context) =>editProfileworkerPage(user:user)),
    );
    updataName(information);
  }
  String _name ;

  final WorkerData user ;
  //Carduser( {Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(child:Row(
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.fromLTRB(7,7,7,0),
            height: 100,
            width: double.maxFinite,
            child: Card(
                elevation: 5,
                //  color: Colors.orange,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child:Column(children: [

                  // new SizedBox(
                  //   height: 130,
                  //   width: MediaQuery.of(context).size.width,
                  //   // child:Image.network('https://dbq8hrmshvuto.cloudfront.net/a2d/f98c8/0803/4c93/9ebe/05596a8ed7a9/normal/516995.jpg',fit: BoxFit.cover,),
                  //   child:Image(image:CachedNetworkImageProvider(productData.image),fit: BoxFit.cover,),
                  //
                  // ),
                  Expanded(child: ListTile(
                    leading: CircleAvatar(backgroundColor: Colors.black12,backgroundImage:CachedNetworkImageProvider(user.image)),
                    title: Text(user.name,style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                    subtitle: Text(user.phone.toString() ??  ""),

                    trailing:
                    GestureDetector(
                      // chi0ld: Text("llll",style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.w400),),
                    //  child:Icon(Icons.mode_rounded, color: Colors.grey,),
                      child:IconButton(onPressed:(){
                        //  setState(() {



                        Navigator.push(context, MaterialPageRoute(builder: (context) => editProfileworkerPage(user: user,) ));


                        //);
                      },
                        color: Colors.grey,
                        icon:Icon(Icons.mode_rounded) ,
                      ),
                      onTap: () {

                        // Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetail(productData,categorizeData)) );
                      //  Navigator.push(context, MaterialPageRoute(builder: (context) => editProfileworkerPage(user: user,)));
                        moveToSecondPage();
                      },),
                    onTap: () {
                      //  Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetail(productData,categorizeData)) );
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>PageMarketbyworker(user:user)) );
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),)


                ],

                )

            ) ,


          )
          ),

        ]
    ),
      onTap: (){
        //  Navigator.push(context, MaterialPageRoute(builder: (context) =>ProductDetail(productData,categorizeData)) );

        // navigetor("");
      },

    );
  }
}

















