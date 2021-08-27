import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:structurepublic/src/models/WorkerData.dart';
import 'package:structurepublic/src/models/user.dart';

import '../helpers/custom_trace.dart';
import '../models/setting.dart';

ValueNotifier<Setting> setting = new ValueNotifier(new Setting());
final navigatorKey = GlobalKey<NavigatorState>();
String tokenn;
final Userss userss=new Userss();
//LocationData locationData;

/*Future<Userss> loginSettings(String email, String password) async {

  var result = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
  if (result != null) {
    userss.UserssLogin(result.user.uid, email);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    // getUser
    //return result.user;
    await addtokenuser();
    return  await getUser() ;
  }
  else {
    print("444444444444444444444444444444");
    return null;
  }
}*/


/*ture<Userss>  signupSettings(String email, String password,String name) async {
  var result = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);

  if (result != null) {
    userss.UserssSign(result.user.uid, name, email ,result.user.getIdToken().toString(),"users");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    //shared
    return  await addUser() ;
  } else {
    return null;
  }
*/
Future<void> updateUser(Userss user ) async {
  print("Llllllllllllllllllllllllllllllllllllllllllllllllllllll");
  print(user.name);
 //wait addtoken();
  await FirebaseFirestore.instance
      .collection("users").doc(user.id).update(
      {"name":user.name,
        "email":user.email,
        "phone":user.phone,
        "longe":user.long,
        "lat":user.lat,
        "image":user.image,
        "token":tokenn,
      }
  )
      .then((value) async {////////////////////////////////////
    SharedPreferences preferences = await SharedPreferences.getInstance();
    //preferences.clear();
    preferences.setString('user', json.encode(user));
    print(json.encode(user) );
    print("kkkkkkkkkkkkkkkkkkk");
    return value;
  }
  )
      .catchError((e) {});

  return  await getUser();

}
Future<void> deletworker(WorkerData user ,List<String> idmarket) async {
  print("Llllllllllllllllllllllllllllllllllllllllllllllllllllll");
  print(user.name);

  await FirebaseFirestore.instance
      .collection("worker").doc(user.id).update(
      {
        "idMarket":idmarket ,
      }
  )
      .then((value) async {////////////////////////////////////

    print("kkkkkkkkkkkkkkkkkkk");

  }
  )
      .catchError((e) {});

//  return  await getUser();

}
Future<void> addworker(WorkerData user ,List<String> idmarket) async {
  print("Llllllllllllllllllllllllllllllllllllllllllllllllllllll");
  print(user.name);

  await FirebaseFirestore.instance
      .collection("worker").doc(user.id).update(
      {
        "idMarket":idmarket ,
      }
  )
      .then((value) async {////////////////////////////////////

    print("kkkkkkkkkkkkkkkkkkk");

  }
  )
      .catchError((e) {});

//  return  await getUser();

}
Future<void> updateworker(WorkerData user ) async {
  print("Llllllllllllllllllllllllllllllllllllllllllllllllllllll");
  print(user.name);
  //wait addtoken();
  await FirebaseFirestore.instance
      .collection("worker").doc(user.id).update(
      {"name":user.name,
        "email":user.email,
        "phone":user.phone,
        "longe":user.long,
        "lat":user.lat,
        "image":user.image,
        "token":tokenn,
      }
  )
      .then((value) async {////////////////////////////////////
    SharedPreferences preferences = await SharedPreferences.getInstance();
    //preferences.clear();
    preferences.setString('user', json.encode(user));
    print(json.encode(user) );
    print("kkkkkkkkkkkkkkkkkkk");
    return value;
  }
  )
      .catchError((e) {});

  return  await getUser();

}




/*Future<Userss> addUser() async {
  await addtoken();
  await FirebaseFirestore.instance
      .collection("users").doc(userss.id).set(
      {"name":userss.name,//2
        "email":userss.email,//1
        "phone":userss.phone,//4
        "id":userss.id,//1
        "token":tokenn,
        "role":userss.role,
        "image":userss.image,
        "lat":userss.lat,
        "longe":userss.long,
        "timesTamp" :userss.timesTamp,



      }

  )
      .then((value) {
  }).catchError((e) {});
  return  await getUser();


}*/
/*ture<void> addtoken()async

{
  final FirebaseMessaging _fcm=FirebaseMessaging();
  await  _fcm.getToken().then((value) {print("qqqqqqqqqqqqq"  + value.toString() );
  tokenn=value.toString();});
}*/

/*ture<void> addtokenuser()async

{
  await addtoken();
  await FirebaseFirestore.instance
      .collection("users").doc(userss.id).update(
      {"token":tokenn,}

  )
      .then((value) {
  }).catchError((e) {});

}*/
/*Future<void> deleteUser(String userssid) async {
  print("111111111111111111111111");
  await FirebaseFirestore.instance
      .collection("users").doc(userssid).delete()
      .then((value) {
    print("deleeeeeeee");
  }).catchError((e) {});

}
Future<void> deleteWorker(String userssid) async {
  print("111111111111111111111111");
  await FirebaseFirestore.instance
      .collection("worker").doc(userssid).delete()
      .then((value) {
    print("deleeeeeeee");
  }).catchError((e) {});

}*/

//SharedPref sharedPref=SharedPref();

Future<List<Userss>> getUser() async {
 print("mmmmm") ;
 List<Userss> users=[];
    await FirebaseFirestore.instance
        .collection("users").where("role",isEqualTo:"users")
        .get()
        .then((value) {
          print(value.docs.length) ;
    for(int i=0 ;i<value.docs.length ;i++) {
      print("ghgh") ;
      users.add(Userss.fromJson(value.docs[i].data())) ;
      print("ghgh") ;
      print(users.length);
    }
    }
    ).catchError((e){}) ;
    print("kkkkkkkkkkkkkkkk") ;
    print(users.length) ;
    return users;
  }
Future<List<Userss>> getAdmin() async {
 //wait addtokenuser();
  List<Userss> users=[];
  await FirebaseFirestore.instance
      .collection("users").where("role",isEqualTo:"admin")
      .get()
      .then((value) {
    for(int i=0 ;i<value.docs.length ;i++)
      users.add(Userss.fromJson(value.docs[i].data()));
  }
  );
  return users;
}

Future<List<WorkerData>> getworker() async {
 //wait addtokenuser();
  List<WorkerData> Worker=[];
  print("mnnnnnnnnn") ;
  await FirebaseFirestore.instance
      .collection("worker").get().then((value) {
    print(value.docs.length);
    for (int i = 0; i < value.docs.length; i++) {
      Worker.add(WorkerData.fromJson(value.docs[i].data()));
      print("male1111");
    }
  }
  ).catchError((e){}) ;
  print("male") ;
  print(Worker.length) ;
  print("male") ;
  return Worker  ;
}




//Userss users;
// if(user==null)
// {
//
//   await FirebaseFirestore.instance
//       .collection("users").doc(userss.id)
//       .get()
//       .then((value) {
//
//     users= Userss.fromJson(value.data());
//   }
//   )
//       .catchError((e) {});
//   return users;
// }
//
// else
// {
//   users=user;
//   return users ;
//
// }


/*

Future<Userss> userfirebase() async
{
  Userss b;
  b= await getUser().then((value)=>value);
  j=b.name;
  print(b.name);
  return b;

}*/



