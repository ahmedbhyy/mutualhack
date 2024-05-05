import 'package:get/get.dart';

abstract class CategoriesDetailsController extends GetxController {}

class CategoriesDetailsControllerImp extends CategoriesDetailsController {
  List<Map> categories = [
    {
      "image": "images/math.png",
      "title": "Une équation du troisième degré",
      "subtitle": "2éme séance",
    },
    {
      "image": "images/math1.png",
      "title": "Une équation du deuxième degré",
      "subtitle": "3éme séance",
    },
    {
      "image": "images/math2.png",
      "title": "Resolution des Problémes",
      "subtitle": "Partage des idées",
    },
  ];
}
