import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:structurepublic/src/elements/DialogEditSectionWidget.dart';
import 'package:structurepublic/src/models/SectionData.dart';
import 'package:structurepublic/src/repository/SectionRepository.dart' as repo;

import 'package:structurepublic/src/repository/repouser.dart'as repo;

import '../../generated/l10n.dart';
import '../helpers/helper.dart';
import '../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PageMainController extends ControllerMVC {
  //User user = new User();
  bool loading = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  OverlayEntry loader;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  List<SectionData> listSection = [];

  TextEditingController _nameSectionAr = new TextEditingController();
  TextEditingController _nameSectionEn = new TextEditingController();

  TextEditingController get nameSectionAr => _nameSectionAr;
  TextEditingController get nameSectionEn => _nameSectionEn;

  String imageUrl;

  List<SectionData> list1 = [];
  List<int> list2 = [];
  List map=[];
  List map2=[];

  PageMainController() {
    loader = Helper.overlayLoader(context);
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }



  getSections1() async {
    setState((){
      list1.clear();
    });
    await repo.getSections1().then((value) {
      setState((){
        list1.addAll(value);
      });
    });
    setState((){
      list2.clear();
    });
    // await getSections1();
    for(int i = 0; i < list1.length; i++){

      await repo.getSections2(list1[i]).then((value) {
        setState((){
          list2.add(value);
        });
      });

    }

    for(int i = 0; i < list1.length; i++){
setState((){ map.add({"name section":list1[i].nameAr,"number market":list2[i]});});

    }

    await repo.getAdmin().then((value) =>{
      setState((){ map2.add({"name section":"أصحاب المتاجر","number market":value.length});})
    });
    await repo.getUser().then((value) =>{
      setState((){ map2.add({"name section":"المستخدمين","number market":value.length});})

    });
    await repo.getworker().then((value) =>{
      setState((){map2.add({"name section":"عمال التوصيل","number market":value.length});})

    });

    print("nnnnnnnnnnnn");
    print(map2[0]["number market"].toString());

  }
/* getSections3() async {

    setState((){
      map.clear();
    });

    await repo.getSections4(list1,list2).then((value) {

      setState((){
        map.addAll(value);
      });
  });}*/


  @override
  void initState() {
    super.initState();
    getSections();
    getSections1();
  }

  getSections() async {
    setState((){
      listSection.clear();
    });
    await repo.getSections().then((value) {
     setState((){
       listSection.addAll(value);
     });

    });
  }

  Future getImage() async {
    // File _image;
    // final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    // setState(() async {
    //   if (pickedFile != null) {
    //     _image = await File(pickedFile.path);
    //     imageUrl = await repo.upLoadImage(_image);
    //   } else {
    print('No image selected.');
    //   }
    //   imageUrl;
    // });
  }

  showEditDialog(SectionData sectionData,
      PageMainController pageMainController) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return EditSection(sectionData, pageMainController);
        });
  }


  Future editSection(SectionData sectionData) async {
    bool addToList=false;
    if(sectionData.id.isEmpty){
      addToList=true;
      sectionData.id=Uuid().generateV4();
    }
    sectionData.nameAr = nameSectionAr.text;
    sectionData.nameEn = nameSectionEn.text;
    sectionData.image = imageUrl.toString();
    await repo.postSectionNode(sectionData);
    setState(() {
      sectionData;
      if(addToList){
        listSection.add(sectionData);
      }
      listSection;
    });
    print("loooooooooooooooooooooooooooooooooooooooooooooooool");

    print("hidehidehidehidehide");
  }

  Future hideSection(SectionData sectionData) async {
    sectionData.hide = !sectionData.hide;
    await repo.postSectionNode(sectionData);
    setState((){sectionData.hide;});
    print("hidehidehidehidehide");
  }

}
