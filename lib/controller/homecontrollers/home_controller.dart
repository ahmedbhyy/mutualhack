import 'dart:async';

import 'package:get/get.dart';
import 'package:mutualhack/view/homescreens/categories/all_categories.dart';
import 'package:mutualhack/view/homescreens/categories/allcours.dart';

import '../../view/homescreens/notifications.dart';

abstract class HomeController extends GetxController {
  gotonotification();
  updateColor(int index);
  updateColor1(int index);
  gotoallcourses();
  gotoallcategories();
}

class HomeControllerImp extends HomeController {
  HomeControllerImp() {
    categories = [
      "Science",
      "Mathématique",
      "Physique",
      "Chimie",
      "Anglais",
      "Programmation"
    ];
    isSelectedList = List<bool>.filled(categories.length, false);
    isSelectedList[0] = true;
    categories1 = [
      "Tout",
      "Algébre",
      "Geométrie",
      "Probabilité",
    ];
    isSelectedList1 = List<bool>.filled(categories1.length, false);
    isSelectedList1[0] = true;
  }
  int currentindex = 0;
  late Timer timer;
  String matierecategorie = "Science";
  String matierecategorie1 = "Tout";
  List<String> categories = [];
  List<String> categories1 = [];

  List<String> eventimages = ["discount2", "coupon"];
  List<bool> isSelectedList = [];
  List<bool> isSelectedList1 = [];
  List<Map> categories2 = [
    {
      "image":
          "https://static.vecteezy.com/ti/vecteur-libre/p3/4251240-apprentissage-mathematiques-de-education-et-connaissance-fond-cartoon-vector-illustration-science-technologie-ingenierie-formule-ou-math-de-base-vectoriel.jpg",
      "name": "Math pour les enfants"
    },
    {
      "image":
          "https://img.freepik.com/free-vector/cartoon-math-background_23-2148151175.jpg?size=338&ext=jpg&ga=GA1.1.553209589.1714348800&semt=ais",
      "name": "Les bases",
    },
    {
      "image": "https://cdn-icons-png.freepik.com/512/4720/4720458.png",
      "name": "resolution des éqs",
    },
    {
      "image":
          "https://i.pinimg.com/originals/06/d2/cf/06d2cfa5cd7f8fbe8e94ef5d75496a75.png",
      "name": "l'histoire de la Tunisie",
    }
  ];

  @override
  void onInit() {
    timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      currentindex = (currentindex + 1) % eventimages.length;
      update();
    });
    super.onInit();
  }

  @override
  void updateColor(index) {
    isSelectedList = List<bool>.filled(categories.length, false);
    isSelectedList[index] = !isSelectedList[index];
    update();
  }

  @override
  void updateColor1(index) {
    isSelectedList1 = List<bool>.filled(categories1.length, false);
    isSelectedList1[index] = !isSelectedList1[index];
    update();
  }

  @override
  gotonotification() {
    Get.to(const Notifications());
  }

  @override
  gotoallcategories() {
    Get.to(const AllCategories());
  }

  @override
  gotoallcourses() {
    Get.to(const AllCourses());
  }
}
