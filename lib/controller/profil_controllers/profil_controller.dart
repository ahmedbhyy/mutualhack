import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutualhack/view/profil_screen/edit_profil.dart';
import 'package:mutualhack/view/profil_screen/mymap.dart';
import '../../view/profil_screen/settings.dart';

abstract class ProfilController extends GetxController {
  logout();
}

class ProfilControllerImp extends ProfilController {
  String imageFile = "https://cdn-icons-png.freepik.com/512/3001/3001764.png";
  ProfilControllerImp() {
    categoriespages = [
      const EditProfil(),
      const SettingsProfil(),
      const MyMap(),
    ];
  }
  List<String> categoriesprofil = [
    "Modifier le profil",
    "Paramètres",
    "Localiser votre enfant"
  ];
  List<String> categoriesprofilimages = ["editprofil", "settings", "findus"];
  List<String> categoriesprofildescription = [
    "Modifier votre prénom la photo de profil",
    "Modifier les paramétres",
    "Localiser votre enfant"
  ];
  List<Widget> categoriespages = [];

  @override
  logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed("/signin");
    } catch (e) {
      return;
    }
  }
}
