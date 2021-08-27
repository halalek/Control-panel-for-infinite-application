import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/controler/usercontroller.dart';
import 'package:structurepublic/src/models/user.dart';
import 'package:structurepublic/src/repository/repouser.dart'as repo;

import 'Pagemain.dart';
import 'SectionPage.dart';
import 'TestPage.dart';
import 'mainchartspage.dart';
class editProfilePage extends StatefulWidget
{
  final Userss user;

  const editProfilePage( {Key key, this.user}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _editProfilePage(this.user);
  }

}

String labelText1,  placeholder;
bool cheak=false;
//SharedPref sharedPref=SharedPref();
class  _editProfilePage extends StateMVC<editProfilePage> {
  UserController _con;
  TextEditingController nameController1= TextEditingController();
  int fullName1=0;
  TextEditingController nameController2= TextEditingController();
  int fullName2=0;
  TextEditingController nameController3= TextEditingController();
  int fullName3=0;
  TextEditingController nameController4= TextEditingController();
  int fullName4=0;
 final Userss user;

  _editProfilePage( this.user) : super(UserController())  {
    // _con = controller;
    _con = controller;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue[900],
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                color: Colors.black12,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainchartsWidget(),
                      ),
                    );
                  },
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
                color: Colors.black12,
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
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => pagemain(),
                      ),
                    );
                  },
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
      body:Container(

        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Center(
    child:Container(
      color: Colors.white,
    width: MediaQuery.of(context).size.width*(2/3),
        child:  ListView(
            children: [
              Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: ClipPath(
                      //clipper: ClippingClass(),
                      child: Container(
                        height: 130.0,
                        decoration: BoxDecoration(color: Colors.blue),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child:Stack(
                        children: [
                          Container(

                            width: 120,
                            height: 120,

                            decoration: BoxDecoration(

                                border: Border.all(
                                    width: 4,
                                    color: Colors.blue),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      color: Colors.black.withOpacity(0.1),
                                      offset: Offset(0, 10))
                                ],
                                shape: BoxShape.circle,
                                //
                                image: DecorationImage(

                                  fit: BoxFit.fill,

                                  image:CachedNetworkImageProvider(user.image ?? "https://www.seekpng.com/png/full/89-891255_fast-food-png-food.png"),

                                )

                            ),

                          ),
                        /*  Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.purpleAccent,
                                  ),
                                  color:Colors.purpleAccent,
                                ),
                               /* child: IconButton(
                                  icon: Icon(Icons.edit,color: Colors.black12,),
                                  onPressed: (){
                                    displayBottomSheet(context);
                                  },
                                ),*/
                              )),*/
                        ],
                      ),
                    ),

                  )
                ],
              ),


             Container(
              decoration: BoxDecoration(

                image: DecorationImage(
                  image: CachedNetworkImageProvider("https://www.seekpng.com/png/full/89-891255_fast-food-png-food.png"),
                  fit: BoxFit.fill,
                //  alignment: Alignment.topCenter,
                ),
              ),
              ),
              SizedBox(
                height: 15,
              ),

              SizedBox(
                height: 35,
              ),

              Padding(

                padding: const EdgeInsets.only(bottom: 35.0),
                child:  TextField(

                  controller: nameController1,
                  decoration: InputDecoration(
                    //  enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: darkfont), ),
                    //  focusedBorder: UnderlineInputBorder( borderSide: BorderSide(color: changecolor), ),



                      // contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: labelText1="Full Name",
                      labelStyle: TextStyle(
                        color: const Color(0XFF424242),),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText:  user.name,
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
                  // onSubmitted: (text){
                  //   setState(() {
                  //     fullName1=2;
                  //     print("666666666666666");
                  //     print(fullName1);
                  //   });
                  //
                  // },
                  onChanged: (text) {
                    fullName1=2;
                    print("First text field: $text");
                  },


                ),
              ),

              Padding(

                padding: const EdgeInsets.only(bottom: 35.0),

                child: TextField(

                  controller: nameController2,
                  decoration: InputDecoration(
                    //  enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: darkfont), ),
                   //   focusedBorder: UnderlineInputBorder( borderSide: BorderSide(color: changecolor), ),



                      // contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: labelText1="E-mail",
                      labelStyle: TextStyle(
                        color: const Color(0XFF424242),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText:  user.email,
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),

                  // onSubmitted: (text){
                  //   setState(() {fullName2="a";});
                  //   print("4444444444444444444");
                  //   print(fullName2);
                  // },
                  onChanged: (text) {
                    fullName2=2;
                    print("First text field: $text");
                  },
                ),
              ),
              Padding(

                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  controller: nameController3,
                  decoration: InputDecoration(
                    //  enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: darkfont), ),
                   //   focusedBorder: UnderlineInputBorder( borderSide: BorderSide(color: changecolor), ),

                      labelText: labelText1="Phone",
                      labelStyle: TextStyle(
                        color: const Color(0XFF424242),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText:  user.phone.toString(),
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),

                  // onSubmitted: (text){
                  //   setState(() {fullName3="a";});
                  //   print("5555555555");
                  //   print(fullName3);
                  // },

                  onChanged: (text) {
                    fullName3=2;
                    print("First text field: $text");
                  },
                ),
              ),

              Padding(

                padding: const EdgeInsets.only(bottom: 35.0),
                child:  TextField(

                  controller: nameController4,
                  decoration: InputDecoration(
                    //  enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: darkfont), ),
                    //  focusedBorder: UnderlineInputBorder( borderSide: BorderSide(color: changecolor), ),



                    // contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: labelText1="role",
                      labelStyle: TextStyle(
                        color: const Color(0XFF424242),),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText:  user.role,
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
                  // onSubmitted: (text){
                  //   setState(() {
                  //     fullName1=2;
                  //     print("666666666666666");
                  //     print(fullName1);
                  //   });
                  //
                  // },
                  onChanged: (text) {
                    fullName4=2;
                    print("First text field: $text");
                  },


                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),

                    ),


                    onPressed: () {    Navigator.of(context).pop();},
                    color: Colors.blue ,
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.blue)),
                  ),


                  RaisedButton(
                    onPressed: ()  {
                      setState((){
                        if(fullName1==2){
                          user.name=nameController1.text;}
                        if(fullName2==2){
                          user.email=nameController2.text;}
                        if(fullName3==2){
                          user.phone=int.parse(nameController3.text)
                          ;}
                        if(fullName4==2){
                          user.role=nameController4.text
                          ;}
                        print("kjkkkkkkkkkkkkkkkk");
                        print( user.name);
                        repo.updateUser(user);
                      }
                      );

                      Navigator.pop(context,user.name);

                      //  _loginrController.loginfirebase();

                      //    Navigator.pushReplacement(context, MaterialPageRoute(builder: ( context) => StartMain() ) );
                    },
                    //   onPressed: () {
                    //     setState(()
                    //
                    //     {
                    //       if(fullName1=="a"){
                    //         print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
                    //       _con.user.name=nameController1.text;}
                    //       if(fullName2=="a"){
                    //     _con.user.email=nameController2.text;}
                    //       if(fullName3=="a"){
                    //     _con.user.phone=int.parse(nameController3.text);}
                    //
                    // //  sharedPref.save('user', _con.user);
                    //       print("45454545"   + _con.user.name );
                    //   //  repo.updateUser(_con.user);
                    //     //  Navigator.pop(context,_con.user.name);
                    //   //   Navigator.pushNamed(context, '/b');
                    //     }
                    //     );
                    //   },
                   // color: changecolor,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.blue,
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),
      ),
    );
  }
}