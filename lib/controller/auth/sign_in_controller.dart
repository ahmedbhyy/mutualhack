import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../view/Slides/slide_right.dart';
import '../../view/auth/sign_up.dart';

abstract class SignInController extends GetxController {
  hidepaasword();
  forgetpassword(String email);
  signin(String email, String password);
  gotosignup(BuildContext context);
  signInWithGoogle(BuildContext context);
}

class SignInControllerImp extends SignInController {
  TextEditingController? email;
  TextEditingController? password;
  bool ispasswordhidden = true;
  GlobalKey<FormState>? formStateSignIn;
  bool isloading1 = false;
  bool isloading2 = false;
  bool isloading3 = false;

  List<Map> signingooglefb = [
    {
      "image": Image.asset(
        "images/google.png",
      ),
    },
    {
      "image": const Icon(
        Icons.facebook,
        color: Colors.blue,
        size: 30,
      ),
    }
  ];

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    formStateSignIn = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  gotosignup(BuildContext context) {
    Navigator.of(context).pushReplacement(
      SlideRight(
        page: const SignUp(),
      ),
    );
  }

  @override
  hidepaasword() {
    ispasswordhidden = !ispasswordhidden;
    update();
  }

  @override
  forgetpassword(String email) async {
    try {
      isloading2 = true;
      update();
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      isloading2 = false;
      update();
      return Get.rawSnackbar(
          title: "Reset Password",
          message: "An email was send to you. Please Reset your password !",
          backgroundColor: Colors.green);
    } catch (e) {
      return Get.rawSnackbar(
          title: "Error",
          message: "Email not found. Please try again",
          backgroundColor: Colors.red);
    }
  }

  @override
  signin(String email, String password) async {
    try {
      isloading1 = true;
      update();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      isloading1 = false;
      update();
      if (credential.user!.emailVerified) {
        Get.offAllNamed("/scan");
      } else {
        return Get.rawSnackbar(
            title: "Verify Your Account",
            message: "An email was send to you. Please verify your Account",
            backgroundColor: Colors.red);
      }
    } on FirebaseAuthException catch (e) {
      isloading1 = false;
      if (e.code == 'user-not-found') {
        return Get.rawSnackbar(
            title: "user-not-found",
            message: "No user found for that email. Please Sign up",
            backgroundColor: Colors.red);
      } else if (e.code == 'wrong-password') {
        return Get.rawSnackbar(
            title: "Wrong password",
            message: "Wrong password provided for that user.",
            backgroundColor: Colors.red);
      } else {
        return Get.rawSnackbar(
            title: "Error",
            message: "Please try again",
            backgroundColor: Colors.red);
      }
    } catch (e) {
      isloading1 = false;
      return Get.rawSnackbar(
          title: "Error",
          message: "Please try again",
          backgroundColor: Colors.red);
    }
  }

  @override
  Future signInWithGoogle(context) async {
    try {
      isloading3 = true;
      update();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return Get.rawSnackbar(
            title: "Google Sign in", message: "no account selected ");
      } else {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
        Get.offAndToNamed("/start");
        isloading3 = false;
        update();
      }
    } catch (e) {
      isloading3 = false;
      update();
      return Get.rawSnackbar(title: "Error", message: "Please try again");
    }
  }
}
