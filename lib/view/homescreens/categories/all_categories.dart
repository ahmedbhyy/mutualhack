import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mutualhack/controller/homecontrollers/allcategories_controller.dart';
import 'package:mutualhack/view/homescreens/categories/categorie_details.dart';
import 'package:mutualhack/view/widgets/generalwidgets/commonappbar.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AllcategoriesControllerImp());
    return SafeArea(
      child: GetBuilder<AllcategoriesControllerImp>(
        builder: (controller) => Scaffold(
          backgroundColor: const Color(0Xfff5f9ff),
          body: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              const AppBarCommon(title: "Les catégories"),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Recherche ...",
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    suffixIcon: const Icon(
                      Icons.manage_search_rounded,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: controller.categories.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Get.to(
                      CategoriesDetails(
                        title: controller.categories[index]["title"],
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.white,
                    margin: const EdgeInsets.all(10.0),
                    elevation: 4.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.asset(controller.categories[index]["image"]),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.categories[index]["title"],
                                style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Icon(
                                Icons.arrow_circle_right_sharp,
                                color: Colors.blue,
                                size: 18,
                              )
                            ],
                          )
                        ],
                      ),
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
