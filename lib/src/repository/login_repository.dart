import 'dart:async';
import 'dart:convert';

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
final WorkerData worker=new WorkerData() ;
//LocationData locationData;

Future<Userss> loginSettings(String email, String password) async {

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
}

Future<WorkerData>  signupworkerSettings(String email, String password,String name) async {
  print("ghedoooooooooooooworkerrrrrrrrrrrrr") ;
  var result = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);
List<String>market=[""] ;
  if (result != null) {
    print("resutnot null") ;
worker.WorkerSign( result.user.uid, name, email, result.user.getIdToken().toString(),market) ;
//WorkerSign( result.user.uid, name, email, result.user.getIdToken().toString(),) ;

    return  await addWorker() ;
  }
  else {
    print("nullllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll") ;
    return null;
  }
}

Future<Userss>  signupSettings(String email, String password,String name,int v) async {
  print("ghedo") ;
  var result = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);

  if (result != null&& v==0) {

    userss.UserssSign(
        result.user.uid, name, email, result.user.getIdToken().toString(),
        "users");
    return  await addUser() ;
  }
 else   if (result != null&& v==1) {
   print("mlethfff") ;
      userss.UserssSign(result.user.uid, name, email ,result.user.getIdToken().toString(),"admins");
   // SharedPreferences preferences = await SharedPreferences.getInstance();
   // preferences.clear();
   //shared

    return  await addUser() ;
  } else {
   print("null") ;
    return null;
  }
}
Future<void> updateUser(Userss user ) async {
  print("Llllllllllllllllllllllllllllllllllllllllllllllllllllll");
  print(user.name);
  await addtoken();
  await FirebaseFirestore.instance
      .collection("users").doc(user.id).update(
      {"name":user.name,
        "email":user.email,
        "phone":user.phone,
        "long":user.long,
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


addWorker() async {

  print("jjjjnnnnnnnnnnnnnnnnnnnnnnnnnkkkkk") ;
  print(worker.id) ;
  await FirebaseFirestore.instance
      .collection("worker").doc(worker.id).set(
      {"name":worker.name,//2
        "email":worker.email,//1
        "phone":worker.phone,//4
        "id":worker.id,//1
        "token":tokenn,
        "image":worker.image,
        "lat":worker.lat,
        "long":worker.long,
        "timesTamp" :worker.timesTamp,
        "visible":worker.visible,
        "id_market":worker.idMarket,
      }

  )
      .then((value) {
  }).catchError((e) {});



}

addUser() async {
print("jjjjnnnnnnnnnnnnnnnnnnnnnnnnnkkkkk") ;
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
         "long":userss.long,
         "timesTamp" :userss.timesTamp,
      }

  )
      .then((value) {
  }).catchError((e) {});


}

Future<void> addtoken()async

{
 final FirebaseMessaging _fcm=FirebaseMessaging();
await  _fcm.getToken().then((value) {print("qqqqqqqqqqqqq"  + value.toString() );
 tokenn=value.toString();});
}

Future<void> addtokenuser()async

{
  await addtoken();
  await FirebaseFirestore.instance
      .collection("users").doc(userss.id).update(
      {"token":tokenn,}

  )
      .then((value) {
  }).catchError((e) {});

}
Future<void> deleteUser(String userssid) async {
  print("111111111111111111111111");
  await FirebaseFirestore.instance
      .collection("users").doc(userssid).delete()
      .then((value) {
    print("deleeeeeeee");
  }).catchError((e) {});

}


//SharedPref sharedPref=SharedPref();

Future<Userss> getUser() async {
  //await addtokenuser();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var user = preferences.getString('user');
  Userss users=new Userss();

  if(user==null)
    {
      await FirebaseFirestore.instance
          .collection("users").doc(userss.id)//.where("id",isEqualTo:userss.id.toString()).where("role",isEqualTo:"admin")
          .get()
          .then((value) {
        users= Userss.fromJson(value.data());

      }
      );

      return users;
    }

  else
    {
      users=Userss.fromJson(json.decode(user));
    // users=user;
      return users ;

    }

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



