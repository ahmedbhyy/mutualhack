import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutualhack/controller/homecontrollers/categories_details_controller.dart';
import 'package:mutualhack/view/homescreens/categories/video_cour.dart';
import 'package:mutualhack/view/widgets/generalwidgets/commonappbar.dart';

class CategoriesDetails extends StatelessWidget {
  final String title;
  const CategoriesDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesDetailsControllerImp());
    return SafeArea(
      child: GetBuilder<CategoriesDetailsControllerImp>(
        builder: (controller) => Scaffold(
          backgroundColor: const Color(0Xfff5f9ff),
          body: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              AppBarCommon(title: title),
              ...List.generate(
                controller.categories.length,
                (index) => InkWell(
                  onTap: () {
                    Get.to(VideoApp(
                      title: controller.categories[index]["title"],
                    ));
                  },
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
                      leading:
                          Image.asset(controller.categories[index]["image"]),
                      trailing: const Icon(Icons.cast_for_education,
                          color: Color.fromARGB(255, 67, 78, 199)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
