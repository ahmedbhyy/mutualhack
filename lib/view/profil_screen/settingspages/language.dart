import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutualhack/view/widgets/generalwidgets/common_container.dart';

import '../../../controller/profil_controllers/settings/language_controller.dart';
import '../../widgets/generalwidgets/commonappbar.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LanguageControllerImp());
    return Scaffold(
           backgroundColor: const Color(0Xfff5f9ff),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          children: [
            const AppBarCommon(title: "Langues"),
            Image.asset(
              "images/language.png",
              height: 200.0,
            ),
            GetBuilder<LanguageControllerImp>(
              builder: (controller) => CommonContainerBills(
                mywidget: Column(
                  children: [
                    const Text(
                      "choisissez la langue",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 13, 98, 78),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    ...List.generate(
                      controller.languages.length,
                      (index) => SizedBox(
                        height: 70.0,
                        child: Card(
                          elevation: 5.0,
                          color: Colors.white,
                          margin: const EdgeInsets.all(10.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: InkWell(
                              onTap: () {
                                controller.updateColor(index);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.languages[index],
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      color: controller.isSelectedList[index]
                                          ? const Color.fromARGB(
                                              255, 45, 15, 199)
                                          : const Color.fromARGB(
                                              255, 99, 150, 151),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  AnimatedContainer(
                                    width: 20.0,
                                    decoration: BoxDecoration(
                                      color: controller.isSelectedList[index]
                                          ? const Color.fromARGB(
                                              255, 45, 15, 199)
                                          : Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 300),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
