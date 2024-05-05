import 'package:get/get.dart';

abstract class CourController extends GetxController {}

class CourControllerImp extends CourController {
  List<Map> categories = [
    {
      "image": "https://i.pinimg.com/originals/1e/31/6a/1e316a841d19d6b98b1b1621d53701d1.png",
      "title": "L'histoire de peuple tunisien",
      "subtitle": "2éme séance",
    },
    {
      "image": "https://www.tourmag.com/photo/art/grande/72349695-50350381.jpg?v=1682274596",
      "title": "l'histoire de la region ",
      "subtitle": "3éme séance",
    },
    {
      "image": "https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Tunisie_carte.png/220px-Tunisie_carte.png",
      "title": "la Tunisie",
      "subtitle": "4éme séance",
    },
  ];
}
