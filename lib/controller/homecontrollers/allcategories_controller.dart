import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mutualhack/view/Slides/slide_right.dart';

abstract class AllcategoriesController extends GetxController {
  gotospeceficcategorie(Widget mychild, BuildContext context);
}

class AllcategoriesControllerImp extends AllcategoriesController {
 
    List<Map> categories = [
      {
        "image":"images/math.png",
        "title":"Mathématique",
      },{
         "image": "images/physique.png",
      "title": "Physique",
      },
      {
      "image": "images/science.png",
      "title": "Science",
    },
    {
      "image": "images/eng.png",
      "title": "Angalis",
    },
    {
      "image": "images/coding.png",
      "title": "Programmation",
    },
    ];

    @override
    gotospeceficcategorie(mychild, context) {
      Navigator.of(context).push(SlideRight(page: mychild));
    }
  }

