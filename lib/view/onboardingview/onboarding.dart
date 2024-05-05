import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutualhack/view/widgets/onboardingwidget/buton_continue.dart';
import 'package:mutualhack/view/widgets/onboardingwidget/dot_controller.dart';

import '../../controller/onboarding_controller.dart';
import '../widgets/onboardingwidget/custom_slider.dart';


class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomDotControllerOnBoarding(),
                  Spacer(flex: 1),
                  CustomButtonOnBoarding(),
                  Spacer(flex: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
