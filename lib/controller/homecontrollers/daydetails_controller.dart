import 'package:get/get.dart';

abstract class DayDetailsController extends GetxController {}

class DayDetailsControllerImp extends DayDetailsController {
  List<Map> categories = [
    {
      "image": "images/abscence.png",
      "title": "Abscence",
      "subtitle": "05/04/2024",
    },
    {
      "image": "images/abscence.png",
      "title": "Relevé des notes",
      "subtitle": "01/04/2024",
    },
    {
      "image": "images/abscence.png",
      "title": "Sorties",
      "subtitle": "23/03/2024",
    },
  ];
}
