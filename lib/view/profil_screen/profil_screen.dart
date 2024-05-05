import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../controller/profil_controllers/profil_controller.dart';
import '../widgets/generalwidgets/common_containerlisttile.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfilControllerImp controller = Get.put(ProfilControllerImp());
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 10.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My Profil",
                style: GoogleFonts.mulish(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 28, 49, 188),
                ),
              ),
              Image.asset(
                "images/ourlogo2.png",
                width: 55.0,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: MediaQuery.of(context).size.width / 4.0),
            child: CircleAvatar(
              radius: 80.0,
              backgroundImage: NetworkImage(controller.imageFile),
              backgroundColor: Colors.white,
            ),
          ),
          ...List.generate(
            controller.categoriesprofil.length,
            (index) => ContainerListTile(
              mypage: controller.categoriespages[index],
              title: controller.categoriesprofil[index],
              mysubtitle: controller.categoriesprofildescription[index],
              myimage: "images/${controller.categoriesprofilimages[index]}.png",
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              controller.logout();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  "images/lotties/lottie_logout.json",
                  height: 50.0,
                  repeat: false,
                ),
                Text(
                  "Log Out",
                  style: GoogleFonts.mulish(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 1, 100, 78),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
