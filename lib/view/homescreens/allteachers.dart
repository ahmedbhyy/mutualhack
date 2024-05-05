import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mutualhack/controller/homecontrollers/allteachers_controller.dart';
import 'package:mutualhack/view/homescreens/chat.dart';
import 'package:mutualhack/view/widgets/generalwidgets/commonappbar.dart';

class AllTeachers extends StatelessWidget {
  const AllTeachers({super.key});

  @override
  Widget build(BuildContext context) {
    AllTeachersControllerImp controller = Get.put(AllTeachersControllerImp());
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const AppBarCommon(title: "les enseignants"),
            ListView.builder(
              itemCount: controller.teachers.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ListTile(
                  title: Text(controller.teachers[index]["name"]),
                  onTap: () {
                    Get.to(ChatPage(title: controller.teachers[index]["name"]));
                  },
                  subtitle: Text(controller.teachers[index]["year"]),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: controller.teachers[index]["image"],
                      width: 50,
                      placeholder: (context, url) => Lottie.asset(
                        "images/lotties/lottie_loadingpic.json",
                        height: 50.0,
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
