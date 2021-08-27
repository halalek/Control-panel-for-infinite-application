import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/controler/usercontroller.dart';
import 'package:structurepublic/src/models/WorkerData.dart';
import 'package:structurepublic/src/models/user.dart';
import 'package:structurepublic/src/repository/repouser.dart'as repo;
class editProfileworkerPage extends StatefulWidget
{
  final WorkerData user;

  const editProfileworkerPage( {Key key, this.user}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _editProfileworkerPage(this.user);
  }

}

String labelText1,  placeholder;
bool cheak=false;
//SharedPref sharedPref=SharedPref();
class  _editProfileworkerPage extends StateMVC<editProfileworkerPage> {
  UserController _con;
  TextEditingController nameController1= TextEditingController();
  int fullName1=0;
  TextEditingController nameController2= TextEditingController();
  int fullName2=0;
  TextEditingController nameController3= TextEditingController();
  int fullName3=0;
  TextEditingController nameController4= TextEditingController();
  int fullName4=0;
  final WorkerData user;

  _editProfileworkerPage( this.user) : super(UserController())  {
    // _con = controller;
    _con = controller;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,


      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
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

             /* Padding(

                padding: const EdgeInsets.only(bottom: 35.0),
                child:  TextField(

                  controller: nameController4,
                  decoration: InputDecoration(
                    //  enabledBorder: UnderlineInputBorder( borderSide: BorderSide(color: darkfont), ),
                    //  focusedBorder: UnderlineInputBorder( borderSide: BorderSide(color: changecolor), ),



                    // contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: labelText1="Full Name",
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
              ),*/
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {    Navigator.of(context).pop();},
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
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
                        print("kjkkkkkkkkkkkkkkkk");
                        print( user.name);
                        repo.updateworker(user);
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
    );
  }
}