import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mutualhack/controller/homecontrollers/home_controller.dart';
import 'package:mutualhack/view/homescreens/categories/details_cour.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return SafeArea(
      child: GetBuilder<HomeControllerImp>(
        builder: (controller) => Scaffold(
          backgroundColor: const Color(0Xfff5f9ff),
          body: ListView(
            padding: const EdgeInsets.all(18),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Salut, Parent de Mohamed",
                        style: GoogleFonts.abel(
                          color: const Color.fromARGB(255, 29, 42, 220),
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        "Rechercher ci-dessous",
                        style: GoogleFonts.abel(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 13.0,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        shape: BoxShape.circle),
                    child: IconButton(
                      icon: const Icon(
                        Icons.notifications_active_outlined,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        controller.gotonotification();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
              SizedBox(
                height: 250.0,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        key: UniqueKey(),
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          "images/${controller.eventimages[controller.currentindex]}.png",
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: MediaQuery.of(context).size.width / 2.1,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height / 5.1,
                        right: MediaQuery.of(context).size.width / 2.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(
                              controller.eventimages.length,
                              (index) => AnimatedContainer(
                                margin: const EdgeInsets.only(right: 5.0),
                                duration: const Duration(milliseconds: 900),
                                width:
                                    controller.currentindex == index ? 20 : 5,
                                height: 10,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 32, 153, 79),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0.1,
                        top: -36,
                        child: Image.asset(
                          "images/discount.png",
                          height: 60.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Catégories",
                    style: GoogleFonts.abel(
                      color: const Color.fromARGB(255, 29, 42, 220),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.gotoallcategories();
                    },
                    child: Text(
                      "VOIR TOUT",
                      style: GoogleFonts.abel(
                        color: const Color.fromARGB(255, 29, 42, 220),
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
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
                        controller.matierecategorie =
                            controller.categories[index];
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cours",
                    style: GoogleFonts.abel(
                      color: const Color.fromARGB(255, 29, 42, 220),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.gotoallcourses();
                    },
                    child: Text(
                      "VOIR TOUT",
                      style: GoogleFonts.abel(
                        color: const Color.fromARGB(255, 29, 42, 220),
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 50.0,
                  child: ListView.builder(
                    itemCount: controller.categories1.length,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        controller.updateColor1(index);
                        controller.matierecategorie1 =
                            controller.categories1[index];
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
                          color: controller.isSelectedList1[index]
                              ? const Color.fromARGB(255, 67, 78, 199)
                              : Colors.transparent,
                        ),
                        child: Text(
                          controller.categories1[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: controller.isSelectedList1[index]
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 400,
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.categories2.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Get.to(const DetailsCourses());
                    },
                    child: Card(
                      color: Colors.white,
                      margin: const EdgeInsets.all(10.0),
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: controller.categories2[index]["image"],
                              height: 100.0,
                              placeholder: (context, url) => Lottie.asset(
                                "images/lotties/lottie_loadingpic.json",
                                height: 50.0,
                              ),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error,
                                color: Colors.red,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.categories2[index]["name"],
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_circle_right_sharp,
                                  color: Colors.blue,
                                  size: 17,
                                )
                              ],
                            )
                          ],
                        ),
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
