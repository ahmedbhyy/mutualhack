import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutualhack/controller/homecontrollers/allcourses_controller.dart';
import 'package:mutualhack/view/widgets/generalwidgets/commonappbar.dart';

class AllCourses extends StatelessWidget {
  const AllCourses({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllCoursesControllerImp());
    return SafeArea(
      child: GetBuilder<AllCoursesControllerImp>(
        builder: (controller) => Scaffold(
          backgroundColor: const Color(0Xfff5f9ff),
          body: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              const AppBarCommon(title: "Les Cours"),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 50.0,
                  child: ListView.builder(
                    itemCount: controller.categories.length,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        controller.updateColor(index);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        width: 120.0,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.all(6.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xff00aa86), width: 2.0),
                          borderRadius: BorderRadius.circular(20.0),
                          color: controller.isSelectedList[index]
                              ? const Color.fromARGB(255, 67, 78, 199)
                              : Colors.transparent,
                        ),
                        child: Text(
                          controller.categories[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: controller.isSelectedList[index]
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ...List.generate(
                5,
                (index) => InkWell(
                  onTap: () {},
                  child: Card(
                    color: Colors.white,
                    margin: const EdgeInsets.all(10),
                    elevation: 5,
                    child: ListTile(
                      title: Text(
                        controller.categorieall[index]["title"],
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
                            controller.categorieall[index]["subtitle"],
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      leading:
                          Image.asset(controller.categorieall[index]["image"]),
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
