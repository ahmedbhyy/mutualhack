import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutualhack/view/widgets/generalwidgets/common_container.dart';

import '../../../controller/profil_controllers/settings/change_pass_controller.dart';

import '../../widgets/authwidgets/button_auth.dart';
import '../../widgets/generalwidgets/common_loading.dart';
import '../../widgets/generalwidgets/commonappbar.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChangePassControllerImp());
    return GetBuilder<ChangePassControllerImp>(
      builder: (controller) => Form(
        key: controller.formStatechangepassword,
        child: Scaffold(
               backgroundColor: const Color(0Xfff5f9ff),
          body: SafeArea(
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              children: [
                const AppBarCommon(title: "Mot de Passe"),
                Image.asset(
                  "images/editprofil.png",
                  filterQuality: FilterQuality.high,
                  height: 200.0,
                ),
                CommonContainerBills(
                  mywidget: Column(
                    children: [
                      const Text(
                        "Pour garantir la sécurité de votre compte, nous vous enverrons un e-mail avec des instructions sur la façon de réinitialiser votre mot de passe. Votre sécurité et votre confidentialité sont nos priorités absolues, et cette étape de vérification supplémentaire nous aide à protéger votre compte contre tout accès non autorisé.",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color.fromARGB(255, 130, 121, 121),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30.0),
                      controller.isloading
                          ? const CommonLoading()
                          : ButtonAuth(
                              mytitle: "Envoyer",
                              myfunction: () {
                                if (controller
                                    .formStatechangepassword.currentState!
                                    .validate()) {
                                  controller.sendemail();
                                }
                              },
                            ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
