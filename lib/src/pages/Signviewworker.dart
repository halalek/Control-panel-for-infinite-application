
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:structurepublic/src/controler/login_controller.dart';


import '../../generated/l10n.dart';
import '../controler/user_controller.dart';
import '../elements/BlockButtonWidget.dart';
import '../helpers/app_config.dart' as config;
import '../repository/user_repository.dart' as userRepo;

import 'package:firebase_core/firebase_core.dart';










extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPhone{
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}

class SignupworkerMain extends StatefulWidget {
  final int v ;

  const SignupworkerMain({Key key, this.v}) : super(key: key);
  @override
  _SignupworkerMain createState() =>  _SignupworkerMain(this.v);
}


class _SignupworkerMain extends StateMVC<SignupworkerMain> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool  _passwordVisible;
  final int v ;
  // UserController _con;
  LoginController _loginrController;

  _SignupworkerMain(this.v) : super( LoginController()) {
    // _con = controller;
    _loginrController = controller;
  }
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    Firebase.initializeApp();
  }
  @override

  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child:Center(
         child: Container(
        width: MediaQuery.of(context).size.width*(2/3),
            child: Column(
              children: <Widget>[

                Container(
                  height: 700,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/12222.png'),
                        fit: BoxFit.cover,

                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/img/light-11.png')
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/img/light-2.png')
                              )
                          ),
                        ),
                      ),
                      Positioned(
                          right: 40,
                          //  top: 40,
                          width: 80,
                          height: 110,
                          child:  Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/img/light-2.png'),
                                )
                            ),
                          )),

                      // Positioned(
                      //   child:  Container(
                      //     margin: EdgeInsets.only(top: 50),
                      //     child: Center(
                      //       child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                      //     ),
                      //   )
                      // ),

                      Padding(
                        padding: EdgeInsets.only(left:30.0,top:220,right: 30),
                        child:
                        Column(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(5),

                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(143, 148, 251, .2),
                                          blurRadius: 20.0,
                                          offset: Offset(0, 10)
                                      )
                                    ]
                                ),

                                child:Form(
                                  key: _formKey,
                                  child:
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Center(
                                          child: Text("Sign up", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                                        ),

                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        // decoration: BoxDecoration(
                                        //     border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                        // ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          controller: _loginrController.nameController,
                                          inputFormatters: [new WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),],
                                          decoration: InputDecoration(

                                            hintText: 'Enter your name ',
                                            labelText: "Name",
                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                            suffixIcon: Icon(Icons.person),
                                            fillColor: Colors.white,
                                            enabledBorder:OutlineInputBorder(
                                              borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                              borderRadius: BorderRadius.circular(15.0),
                                            ),),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please Fill Name Input';
                                            }
                                            if (value.length > 12 || value.length <4) {
                                              return 'Enter the name correctly';
                                            }

                                            return null;
                                          },
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        // decoration: BoxDecoration(
                                        //     border: Border(bottom: BorderSide(color: Colors.grey[100]))
                                        // ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.emailAddress,
                                          controller: _loginrController.emailController,
                                          decoration: InputDecoration(

                                            hintText: 'Enter your Email ',
                                            labelText: "Email",
                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                            suffixIcon: Icon(Icons.phone),
                                            fillColor: Colors.white,
                                            enabledBorder:OutlineInputBorder(
                                              borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                              borderRadius: BorderRadius.circular(15.0),
                                            ),),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please Fill Email Input';
                                            }

                                            if(!value.isValidEmail)
                                            { return 'Enter the Email correctly';}

                                            return null;
                                          },
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: _loginrController.passwordController,
                                          obscureText: !_passwordVisible,
                                          decoration: InputDecoration(
                                            labelText: "password",
                                            hintText: "Enter your password",
                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                // Based on passwordVisible state choose the icon
                                                _passwordVisible
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,

                                              ),
                                              onPressed: () {
                                                // Update the state i.e. toogle the state of passwordVisible variable
                                                setState(() {
                                                  _passwordVisible = !_passwordVisible;
                                                });
                                              },
                                            ),
                                            fillColor: Colors.white,
                                            enabledBorder:OutlineInputBorder(
                                              borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                              borderRadius: BorderRadius.circular(15.0),
                                            ),),

                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please Fill Password Input';
                                            }
                                            if (value.length<8 || value.length>15) {
                                              return  'password must contain between 8 and 15 characters';
                                            }

                                            //extString
                                            return null;
                                          },
                                        ),
                                      ),

                                      SizedBox(height: 10,),
                                      InkWell(child:
                                      Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                                colors: [
                                                  Color.fromRGBO(143, 148, 251, 1),
                                                  Color.fromRGBO(143, 148, 251, .6),
                                                ]
                                            )
                                        ),
                                        child: Center(
                                          child: Text("Sign up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                        onTap: () async {
                                          if (_formKey.currentState.validate()) {

                                            _loginrController.signupfirebaseworker();
                                            // _loginrController.checksigup();
                                          }

                                        },
                                      )
                                    ],
                                  ),
                                )
                            ),
                            SizedBox(height: 20,),

                          ],
                        ),

                      ),








                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.all(30.0),
                //   child: Column(
                //     children: <Widget>[
                //        Container(
                //         padding: EdgeInsets.all(5),
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //             boxShadow: [
                //               BoxShadow(
                //                   color: Color.fromRGBO(143, 148, 251, .2),
                //                   blurRadius: 20.0,
                //                   offset: Offset(0, 10)
                //               )
                //             ]
                //         ),
                //         child: Column(
                //           children: <Widget>[
                //             Container(
                //               padding: EdgeInsets.all(8.0),
                //               decoration: BoxDecoration(
                //                   border: Border(bottom: BorderSide(color: Colors.grey[100]))
                //               ),
                //               child: TextFormField(
                //                 decoration: InputDecoration(
                //                   labelText: "Resevior Name",
                //                   fillColor: Colors.white,
                //                   enabledBorder:OutlineInputBorder(
                //                     borderSide: const BorderSide(color: Colors.black, width: 2.0),
                //                     borderRadius: BorderRadius.circular(25.0),
                //                   ),),
                //               ),
                //             ),
                //             Container(
                //               padding: EdgeInsets.all(8.0),
                //               child: TextField(
                //                 decoration: InputDecoration(
                //                     border: InputBorder.none,
                //                     hintText: "Password",
                //                     hintStyle: TextStyle(color: Colors.grey[400])
                //                 ),
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //       SizedBox(height: 30,),
                //       Container(
                //         height: 50,
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10),
                //             gradient: LinearGradient(
                //                 colors: [
                //                   Color.fromRGBO(143, 148, 251, 1),
                //                   Color.fromRGBO(143, 148, 251, .6),
                //                 ]
                //             )
                //         ),
                //         child: Center(
                //           child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                //         ),
                //       ),
                //       SizedBox(height: 70,),
                //       Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),),
                //     ],
                //   ),
                // )

              ],
            ),
          ),
        ),
        ),
    );
  }
}