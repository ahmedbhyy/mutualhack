

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutualhack/view/widgets/generalwidgets/common_container.dart';

import '../../../controller/profil_controllers/settings/help_controller.dart';
import '../../widgets/authwidgets/button_auth.dart';
import '../../widgets/authwidgets/text_field_auth.dart';
import '../../widgets/generalwidgets/common_loading.dart';
import '../../widgets/generalwidgets/commonappbar.dart';



class HelpSettings extends StatelessWidget {
  const HelpSettings({super.key});

  @override
  Widget build(BuildContext context) {
    HelpControllerImp controller = Get.put(HelpControllerImp());

    return Form(
      key: controller.formStatereport,
      child: Scaffold(
             backgroundColor: const Color(0Xfff5f9ff),
        body: GetBuilder<HelpControllerImp>(
          builder: (controller) => SafeArea(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 15.0),
                children: [
                  const AppBarCommon(title: "Signaler"),
                  const SizedBox(height: 20.0),
                  Image.asset("images/ourlogo2.png", height: 150.0),
                 CommonContainerBills(

                  mywidget: 
                    Column(
                        children: [
                          const Text(
                            "Votre avis compte ! C'est votre espace pour signaler toute préoccupation, partager des commentaires ou demander de l'aide concernant n'importe quel aspect de nos services. Que ce soit un bug technique, une suggestion d'amélioration ou une question concernant votre compte, nous sommes là pour écouter et aider.",
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Color.fromARGB(255, 130, 121, 121),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10.0),
                          TextFieldAuth(
                            hint: "Votre commentaire",
                            readonly: false,
                            mytype: TextInputType.text,
                            mycontroller: controller.helpcontroller,
                            myicon: const Icon(Icons.report_gmailerrorred_sharp),
                            ispass: false,
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return "Can't to be empty ";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 30.0),
                          controller.isloading
                              ? const CommonLoading()
                              : ButtonAuth(
                                  mytitle: "Envoyer",
                                  myfunction: () {
                                    if (controller.formStatereport.currentState!
                                        .validate()) {
                                      controller.sendreport();
                                    }
                                  },
                                ),
                          const SizedBox(height: 10.0),
                        ],
                      ),
                 ),
               
                ],
              ),
            ),
          ),
        ),
     
    );
  }
}
