import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../Model/data/staticdata/onboarding_list.dart';
import '../../../controller/onboarding_controller.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Column(
          children: [
            Lottie.asset(
              onBoardingList[i].image!,
              width: 250,
              height: 300,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 50),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                onBoardingList[i].title!,
                textAlign: TextAlign.center,
                style: GoogleFonts.aladin(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: const Color.fromARGB(255, 6, 75, 223),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                onBoardingList[i].body!,
                textAlign: TextAlign.center,
                style: GoogleFonts.abhayaLibre(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: const Color.fromARGB(255, 113, 109, 117),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
