import 'package:flutter/material.dart';
import 'package:mutualhack/view/widgets/authwidgets/button_auth.dart';
import 'package:mutualhack/view/widgets/generalwidgets/common_container.dart';
import 'package:mutualhack/view/widgets/generalwidgets/commonappbar.dart';

class NotificationsDetails extends StatelessWidget {
  const NotificationsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const AppBarCommon(title: "Notifications"),
            Hero(
              tag: "images/notifications.png",
              child: Image.asset(
                "images/notifications.png",
                height: 200.0,
              ),
            ),
            CommonContainerBills(
              mywidget: Column(
                children: [
                  const Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                      "Je tiens à vous informer que votre enfant a été absent au cours du mois de mai 2024. Bien que nous comprenions que diverses circonstances peuvent entraîner des absences, nous tenons à souligner l'importance de la présence régulière à l'école pour assurer une progression académique optimale. Si vous avez des questions ou des préoccupations concernant l'absence de votre enfant, n'hésitez pas à me contacter afin que nous puissions travailler ensemble pour assurer son succès scolaire."),
                  const SizedBox(height: 10),
                  ButtonAuth(mytitle: "Contact us", myfunction: () {})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
