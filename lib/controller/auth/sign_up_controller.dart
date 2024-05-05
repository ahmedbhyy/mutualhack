import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../view/Slides/slide_left.dart';
import '../../view/auth/sign_in.dart';

abstract class SignUpController extends GetxController {
  hidepaasword();
  hiderepaasword();
  signup(String email, String password, BuildContext context);

  validatePassword(String value);
  gotosignIn(BuildContext context);
}

class SignUpControllerImp extends SignUpController {
  TextEditingController? email;
  TextEditingController? password;
  TextEditingController? repassword;
  TextEditingController? username;
  bool ispasswordhidden = true;
  bool isrepasswordhidden = true;
  GlobalKey<FormState> formStatesingup = GlobalKey<FormState>();
  bool isloading = false;

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  hidepaasword() {
    ispasswordhidden = !ispasswordhidden;
    update();
  }

  @override
  hiderepaasword() {
    isrepasswordhidden = !isrepasswordhidden;
    update();
  }

  @override
  validatePassword(value) {
    if (value != password!.text) {
      return "Password do not match";
    }
  }

  @override
  gotosignIn(BuildContext context) {
    Navigator.of(context).pushReplacement(
      SlideLeft(
        page: const SignIn(),
      ),
    );
  }

  @override
  signup(email, password, context) async {
    try {
      isloading = true;
      update();
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      isloading = false;
      update();
      // ignore: use_build_context_synchronously
      gotosignIn(context);
      Get.rawSnackbar(
          title: "Verify Your Account",
          message:
              "An email was send to you. Please verify your Account and sign in",
          backgroundColor: Colors.green);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Get.rawSnackbar(
            title: "ERROR",
            message: "The password provided is too weak.",
            backgroundColor: Colors.red);
      } else if (e.code == 'email-already-in-use') {
        return Get.rawSnackbar(
            title: "ERROR",
            message: "The account already exists for that email.",
            backgroundColor: Colors.red);
      }
    } catch (e) {
      isloading = false;
      return Get.rawSnackbar(
          title: "ERROR",
          message: "Please try again later ! $e",
          backgroundColor: Colors.red);
    }
  }
}
