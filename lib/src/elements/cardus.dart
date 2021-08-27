

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/controler/user_controller.dart';
import 'package:structurepublic/src/controler/usercontroller.dart';
import 'package:structurepublic/src/models/user.dart';
import 'package:structurepublic/src/pages/Editprofile.dart';




class Carduser extends StatefulWidget {

  final Userss user ;

 //UserController Con ;



  const Carduser({Key key, this.user}) : super(key: key);
  @override
  _CarduserState createState() => _CarduserState(this.user);
}

class _CarduserState extends State<Carduser> {
  _CarduserState(this.user);

   // UserController Con ;
  void updataName(String name){
    setState(() =>_name = name);

  }
  void moveToSecondPage() async {
    final information = await Navigator.push(
      context,
      CupertinoPageRoute(
          fullscreenDialog: true, builder: (context) =>editProfilePage(user:user)),
    );
    updataName(information);
  }
  String _name ;

  final Userss user ;
  //Carduser( {Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(child:Row(
        children: [
          Expanded(child: Container(
           // height: MediaQuery.of(context).size.height,
          //  width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(7,7,7,0),
            height: 100,
            width: 400,
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
                   // GestureDetector(
                      // chi0ld: Text("llll",style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.w400),),
                      IconButton(onPressed:(){
                      //  setState(() {

                        Navigator.push(context, MaterialPageRoute(builder: (context) => editProfilePage(user: user,)));

/*local=Container(
  child: editProfilePage(user: user),
) ;*/

                        //);
                      },
                        color: Colors.grey,
                        icon:Icon(Icons.mode_rounded) ,
                      ),
                     /* onTap: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context) => editProfilePage(user: user,)));
                        moveToSecondPage();
                      },),*/
                    onTap: () {


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
