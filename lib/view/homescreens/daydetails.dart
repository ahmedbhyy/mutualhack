import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutualhack/controller/homecontrollers/daydetails_controller.dart';
import 'package:mutualhack/view/homescreens/allteachers.dart';

class DayDetails extends StatelessWidget {
  const DayDetails({super.key});

  @override
  Widget build(BuildContext context) {
    DayDetailsControllerImp controller = Get.put(DayDetailsControllerImp());
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0Xfff5f9ff),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(const AllTeachers());
          },
          child: const Icon(
            Icons.chat,
            color: Colors.blue,
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            ...List.generate(
              controller.categories.length,
              (index) => InkWell(
                onTap: () {},
                child: Card(
                  color: Colors.white,
                  margin: const EdgeInsets.all(10),
                  elevation: 5,
                  child: ListTile(
                    title: Text(
                      controller.categories[index]["title"],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(
                          controller.categories[index]["subtitle"],
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    leading: Image.asset(controller.categories[index]["image"]),
                    trailing: const Icon(Icons.cast_for_education,
                        color: Color.fromARGB(255, 67, 78, 199)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
