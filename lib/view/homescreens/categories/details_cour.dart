import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mutualhack/view/widgets/generalwidgets/commonappbar.dart';

import '../../../controller/homecontrollers/cour_controller.dart';

class DetailsCourses extends StatelessWidget {
  const DetailsCourses({super.key});

  @override
  Widget build(BuildContext context) {
    CourControllerImp controller = Get.put(CourControllerImp());
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            const AppBarCommon(title: "Histoire"),
            const SizedBox(height: 20),
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
                    leading: CachedNetworkImage(
                      imageUrl: controller.categories[index]["image"],
                      placeholder: (context, url) => Lottie.asset(
                        "images/lotties/lottie_loadingpic.json",
                        height: 50.0,
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    ),
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
