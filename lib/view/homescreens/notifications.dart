import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutualhack/view/homescreens/categories/notifications_details.dart';

import 'package:mutualhack/view/widgets/generalwidgets/commonappbar.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0Xfff5f9ff),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: const Color.fromARGB(255, 28, 49, 188),
          label: const Row(
            children: [
              Text(
                "Clear all",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(width: 5.0),
              Icon(Icons.delete_outline_rounded, color: Colors.white)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          children: [
            const AppBarCommon(title: "Notifications"),
            Hero(
              tag:   "images/notifications.png",
              child: Image.asset(
                "images/notifications.png",
                height: 200.0,
              ),
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 400.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                    color: Color.fromARGB(255, 230, 243, 255),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(
                        "Abscence ${index + 4}/4/2024 ",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 38, 83, 172),
                        ),
                      ),
                      onTap: () {
                        Get.to(const NotificationsDetails());
                      },
                      subtitle: const Text("Abscence cliquer pour voir plus"),
                      trailing: Image.asset(
                        "images/notifications1.png",
                        height: 40.0,
                      ),
                      leading: const Icon(
                        Icons.notifications_active_outlined,
                        color: Color.fromARGB(255, 138, 126, 126),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  right: 5.0,
                  top: -15,
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 178, 246, 180),
                    radius: 15.0,
                    child: Text("2"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
