import 'package:flutter/material.dart';

import '../../widgets/generalwidgets/common_container.dart';
import '../../widgets/generalwidgets/commonappbar.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           backgroundColor: const Color(0Xfff5f9ff),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          children: [
            const AppBarCommon(title: "Confidentialité"),
            const SizedBox(height: 20.0),
            Image.asset("images/ourlogo2.png", height: 200.0),
            const CommonContainerBills(
              mywidget: Column(
                children: [
                  Text(
                    "Notre application d'éducation en ligne place la confidentialité de nos utilisateurs au premier plan. Avec des fonctionnalités de confidentialité robustes intégrées à chaque étape, nous veillons à ce que les informations sensibles restent sécurisées et privées.",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color.fromARGB(255, 130, 121, 121),
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
