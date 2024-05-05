import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class EditProfil extends GetxController {
  saveUserData();

  bottomSheet(BuildContext context);
}

class EditProfilImp extends EditProfil {
  TextEditingController username = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  Timestamp birthday = Timestamp.now();
  String image = "https://cdn-icons-png.freepik.com/512/3001/3001764.png";
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late User _user;
  bool isloading1 = false;
  bool isloading2 = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<TextEditingController> mycontrollers = [];

  List mylist = [
    {
      "hint": "Nom et Prénom",
      "myicon": const Icon(Icons.person),
      "readonly": false,
    },
    {
      "hint": "Email",
      "myicon": const Icon(Icons.email_outlined),
      "readonly": true,
    },
  ];
  @override
  void onInit() {
    mycontrollers = [username, email];
    _user = _auth.currentUser!;
    email.text = _user.email!;
    fetchUserData();

    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget bottomSheet(context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                icon: const Icon(
                  Icons.camera,
                  color: Color.fromARGB(255, 1, 128, 100),
                ),
                onPressed: () async {},
                label: const Text("Camera"),
              ),
              TextButton.icon(
                icon: const Icon(
                  Icons.image,
                  color: Color.fromARGB(255, 1, 128, 100),
                ),
                onPressed: () async {},
                label: const Text("Gallery"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Future saveUserData() async {
    try {
      isloading1 = true;
      update();
      String nomuser = username.text;
      String number = phone.text;
      Timestamp birthdaydate = birthday;

      await _firestore.collection('users').doc(_user.uid).set({
        'name': nomuser,
        'phone': number,
        'birthdaydate': birthdaydate,
      }, SetOptions(merge: true));
      isloading1 = false;
      Get.rawSnackbar(
          title: "Success",
          message: "Your information has been saved successfully",
          backgroundColor: Colors.green);
      update();
    } catch (e) {
      return Get.rawSnackbar(
          title: "Error",
          message: "Please try again",
          backgroundColor: Colors.red);
    }
  }

  Future fetchUserData() async {
    try {
      isloading2 = true;
      update();
      DocumentSnapshot docSnapshot =
          await _firestore.collection('users').doc(_user.uid).get();
      var userData = docSnapshot.data();
      isloading2 = false;
      update();
      if (docSnapshot.exists) {
        if (userData is Map<String, dynamic>) {
          username.text = userData['name'] ?? "";
          phone.text = userData['phone'] ?? "";

          birthday = userData['birthdaydate'] ?? DateTime.timestamp();
        }
      } else {
        return Get.rawSnackbar(
            title: "Note",
            message: "Please write your informations",
            backgroundColor: Colors.green);
      }
    } catch (e) {
      return Get.rawSnackbar(
          title: "Note",
          message: "Please write your informations",
          backgroundColor: Colors.green);
    }
  }
}
