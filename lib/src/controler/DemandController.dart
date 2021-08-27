import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/elements/DialogShowWorkerWidget.dart';
import 'package:structurepublic/src/models/CategorizeData.dart';
import 'package:structurepublic/src/models/DemandData.dart';
import 'package:structurepublic/src/models/MarketData.dart';
import 'package:structurepublic/src/models/WorkerData.dart';
import 'package:structurepublic/src/pages/InfoDemandPage.dart';
import 'package:structurepublic/src/repository/DemandRepository.dart' as repo;
import 'package:url_launcher/url_launcher.dart';

import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DemandController extends ControllerMVC {
  bool loading = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  List<DemandData> listByAdmin = [];
  List<Userss> selectUser = [];
  List<WorkerData> workerList = [];
  int startTime = DateTime.now().microsecondsSinceEpoch;
  int endTime = DateTime.now().microsecondsSinceEpoch;
  OverlayEntry loader;
  final MarketData marketData;
  Container localContainer ;

  DemandController(this.marketData) {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  @override
  void initState() {
    super.initState();
    getDemands();
  }

  void getDemands() async {
    setState(() {
      listByAdmin.clear();
      selectUser.clear();
    });
    await repo.getDemandNode(this.marketData.id).then((value) {
      value.forEach((element) async {
        await repo.getUserDemand(element).then((elementUser) {
          print("999999999999999999" + elementUser.name);
          setState(() {
            selectUser.add(elementUser);
            listByAdmin.add(element);
          });
        });
      });
    }).catchError((e) => {print("demand" + e)});
  }

  void getDemandsByTime(int start, int end) async {
    setState(() {
      listByAdmin.clear();
      selectUser.clear();
      localContainer=new Container();
    });
    await repo
        .getFilterDemand(this.marketData, start, end)
        .then((value) {
      value.forEach((element) async {
        await repo.getUserDemand(element).then((elementUser) {
          print("999999999999999999" + elementUser.name);
          setState(() {
            selectUser.add(elementUser);
            listByAdmin.add(element);
          });
        });
      });
    }).catchError((e) => {print("demand" + e)});
  }

  void editController(
      DemandData demandData, Userss user, DemandController demandController) {
    setState(() {
      localContainer = new Container();
    });
    setState(() {
      localContainer = new Container(
        child: InfoDemand(demandData, user, demandController),
      );
      localContainer;
      demandController;
    });
  }

  void showLocation(Userss userss) async {
    // print("locationnnnnnnnnnnn"+userss.lat.toString()+"\t"+userss.long.toString());
    // await showLocationPicker(
    //   context,
    //   "AIzaSyDO3WfoiEpkRKCiMePjGszgKZdHvycs_jI",
    //   //initialCenter: LatLng(31.1975844, 29.9598339),
    //   initialCenter: LatLng(userss.lat.toDouble() , userss.long.toDouble()),
    //   automaticallyAnimateToCurrentLocation: false,
    //   //mapStylePath: 'assets/mapStyle.json',
    //   myLocationButtonEnabled: true,
    //   requiredGPS: true,
    //   layersButtonEnabled: true,
    //   //countries: ['AE', 'NG'],
    //   resultCardAlignment: Alignment.bottomRight,
    //   resultCardPadding: EdgeInsets.only(right: 50,bottom: 10),
    //   //desiredAccuracy: LocationAccuracy.best,
    // );
    print("no location selected");
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void removeDemand(DemandData demandData) async {
    demandData.stateAr = "مرفوض ...";
    demandData.stateEn = "unaccepted ...";
    demandData.remove = true;
    demandData.done = true;
    await repo.postDamandNode(demandData, false);
    setState(() {
      demandData;
      listByAdmin;
    });
  }

  void acceptDemand(DemandData demandData) async {
    demandData.stateAr = "مقبول ...";
    demandData.stateEn = "accepted ...";
    demandData.done = true;
    await repo.postDamandNode(demandData, true);
    setState(() {
      demandData;
      listByAdmin;
    });
  }

  showFilterDialog(DemandController demandController) async {
    setState(() {
      listByAdmin.clear();
      selectUser.clear();
      localContainer=new Container();
    });
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width / 4,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(2000, 1, 1),
                                maxTime: DateTime(2100, 1, 1),
                                onChanged: (date) {
                              startTime = date.microsecondsSinceEpoch;
                            }, onConfirm: (date) {
                              startTime = date.microsecondsSinceEpoch;
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.ar);
                          },
                          child: Icon(
                            Icons.more_time,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(Icons.west),
                        SizedBox(
                          width: 3,
                        ),
                        MaterialButton(
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(2000, 1, 1),
                                maxTime: DateTime(2100, 1, 1),
                                onChanged: (date) {
                              endTime = date.microsecondsSinceEpoch;
                            }, onConfirm: (date) {
                              endTime = date.microsecondsSinceEpoch;
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.ar);
                          },
                          child: Icon(
                            Icons.more_time,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              getDemandsByTime(startTime, endTime);
                            });
                          },
                          child: Icon(
                            Icons.done_all,
                            size: 30,
                          ),
                        ),
                        SizedBox(width: 15,),
                      ],
                    )
                  ],
                ))),
          );
        });
  }

  showWorkerDialog(
      DemandData demandData, DemandController demandController) async {
    setState(() {
      workerList.clear();
    });
    await repo.getWorker(demandData.idMarket).then((value) {
      print("wowowowowowowowowonnnnnnnnnnnnnnn" + demandData.idMarket);
      setState(() {
        workerList.addAll(value);
      });
    });
    print("wowowowowowowowowo555555" + workerList.isEmpty.toString());
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return WorkerShow(demandData, workerList, demandController);
        });
    setState(() {
      demandData;
      listByAdmin;
    });
  }

  String convertDate(DateTime dateTime) {
    String stateDate;
    if (dateTime.hour >= 12)
      stateDate = "PM";
    else if (dateTime.hour < 12) stateDate = "AM";
    String ourDate =
        "${dateTime.year.toString()}/${dateTime.month.toString()}/${dateTime.day.toString()}\t\t\t${dateTime.hour.toString()}:${dateTime.minute.toString()}:${dateTime.second.toString()}\t\t$stateDate                                                                                         ";
    return ourDate;
  }
}
