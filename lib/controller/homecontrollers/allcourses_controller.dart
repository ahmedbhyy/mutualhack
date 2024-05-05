import 'package:get/get.dart';

abstract class AllCoursesController extends GetxController {
  updateColor(int index);
}

class AllCoursesControllerImp extends AllCoursesController {
  AllCoursesControllerImp() {
    categories = [
      "Tout",
      "Science",
      "Mathématique",
      "Physique",
      "Chimie",
      "Anglais",
      "Programmation"
    ];
    isSelectedList = List<bool>.filled(categories.length, false);
    isSelectedList[0] = true;
  }

  List<String> categories = [];

  List<bool> isSelectedList = [];

  List<Map> categorieall = [
    {
      "image": "images/chimie1.png",
      "title": "Les états de l’eau",
      "subtitle": "4.2  |  7830 élèves",
    },
    {
      "image": "images/chimie1.png",
      "title": "L'air qui nous entoure",
      "subtitle": "4.4  |  8932 élèves",
    },
    {
      "image": "images/math.png",
      "title": "Une équation du troisième degré",
      "subtitle": "3.2  |  4324 élèves",
    },
    {
      "image": "images/physique.png",
      "title": "Traitement de Signal",
      "subtitle": "4.9  |  12345 élèves",
    },
    {
      "image": "images/coding.png",
      "title": "les structures de contrôle",
      "subtitle": "5.0  |  13453 élèves",
    },
  ];

  @override
  void updateColor(index) {
    isSelectedList = List<bool>.filled(categories.length, false);
    isSelectedList[index] = !isSelectedList[index];
    update();
  }
}
