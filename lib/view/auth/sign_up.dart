import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/auth/sign_up_controller.dart';
import '../widgets/authwidgets/button_auth.dart';
import '../widgets/authwidgets/text_field_auth.dart';
import '../widgets/generalwidgets/common_loading.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp singupcontroller = Get.put(SignUpControllerImp());
    return SafeArea(
      child: Form(
        key: singupcontroller.formStatesingup,
        child: Scaffold(
          backgroundColor: const Color(0xfff5f5f5),
          body: GetBuilder<SignUpControllerImp>(
            builder: (controller) => ListView(
              padding: const EdgeInsets.all(15.0),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FadeInLeft(
                      duration: const Duration(milliseconds: 800),
                      child: Image.asset(
                        "images/ourlogo2.png",
                        height: 70.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                FadeInRight(
                  duration: const Duration(milliseconds: 800),
                  child: Text(
                    "Pour commencer!",
                    style: GoogleFonts.abrilFatface(
                      color: const Color.fromARGB(255, 29, 42, 220),
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                FadeInRight(
                  duration: const Duration(milliseconds: 800),
                  child: const Text(
                    "Créez un compte pour continuer dans notre application",
                    style: TextStyle(fontSize: 13.5),
                  ),
                ),
                const SizedBox(height: 30.0),
                FadeInRight(
                  duration: const Duration(milliseconds: 800),
                  child: TextFieldAuth(
                    hint: "Email",
                    mycontroller: controller.email!,
                    myicon: const Icon(Icons.email_outlined),
                    ispass: false,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Can't to be empty ";
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(val)) {
                        return "Enter a valid email address";
                      }
                      return null;
                    },
                    mytype: TextInputType.emailAddress,
                    readonly: false,
                  ),
                ),
                FadeInRight(
                  duration: const Duration(milliseconds: 800),
                  child: TextFieldAuth(
                    hint: "Nom et Prénom",
                    mycontroller: controller.username!,
                    myicon: const Icon(Icons.person_2_outlined),
                    ispass: false,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Can't to be empty ";
                      }
                      return null;
                    },
                    mytype: TextInputType.text,
                    readonly: false,
                  ),
                ),
                FadeInLeft(
                  duration: const Duration(milliseconds: 800),
                  child: TextFieldAuth(
                    hint: "Met de passe",
                    mycontroller: controller.password!,
                    myicon: const Icon(Icons.key),
                    ispass: controller.ispasswordhidden,
                    mysuffixicon: GestureDetector(
                      onTap: () {
                        controller.hidepaasword();
                      },
                      child: Icon(
                        controller.ispasswordhidden
                            ? Icons.visibility_off
                            // ignore: dead_code
                            : Icons.visibility,
                        color: const Color.fromARGB(255, 26, 105, 30),
                      ),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Can't to be empty ";
                      } else if (val.length < 8) {
                        return 'Weak password';
                      }
                      return null;
                    },
                    mytype: TextInputType.text,
                    readonly: false,
                  ),
                ),
                FadeInLeft(
                  duration: const Duration(milliseconds: 800),
                  child: TextFieldAuth(
                    hint: "Confirmer le mot de passe",
                    mycontroller: controller.repassword!,
                    myicon: const Icon(Icons.key),
                    ispass: controller.ispasswordhidden,
                    mysuffixicon: GestureDetector(
                      onTap: () {
                        controller.hidepaasword();
                      },
                      child: Icon(
                        controller.isrepasswordhidden
                            ? Icons.visibility_off
                            // ignore: dead_code
                            : Icons.visibility,
                        color: const Color.fromARGB(255, 26, 105, 30),
                      ),
                    ),
                    validator: (val) {
                      controller.validatePassword(
                        val!,
                      );
                      return null;
                    },
                    mytype: TextInputType.text,
                    readonly: false,
                  ),
                ),
                const SizedBox(height: 30.0),
                controller.isloading
                    ? const CommonLoading()
                    : FadeInRight(
                        duration: const Duration(milliseconds: 900),
                        child: ButtonAuth(
                          mytitle: "Inscription",
                          myfunction: () {
                            if (controller.formStatesingup.currentState!
                                .validate()) {
                              controller.signup(controller.email!.text,
                                  controller.password!.text, context);
                            }
                          },
                        ),
                      ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Déjà tu as un compte?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.gotosignIn(context);
                      },
                      child: Text(
                        "Se Connecter",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.abel(
                          color: const Color.fromARGB(255, 29, 42, 220),
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sponsored by"),
                    Image.asset(
                      "images/mae.png",
                      height: 100.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
