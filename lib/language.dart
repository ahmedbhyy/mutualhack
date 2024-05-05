import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'view/widgets/onboardingwidget/buttonchooselang.dart';

class ChooseLang extends StatelessWidget {
  const ChooseLang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          children: [
            Lottie.asset("images/lotties/lottie_lang.json"),
            const SizedBox(height: 30.0),
            Text(
              "Choisissez votre langue",
              textAlign: TextAlign.center,
              style: GoogleFonts.aladin(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: const Color.fromARGB(255, 15, 53, 223),
              ),
            ),
            const SizedBox(height: 30.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonChooseLang(
                  mycolor: Color.fromARGB(255, 199, 199, 221),
                  namelang: "Frensh",
                  mycolortext: Color.fromARGB(255, 84, 80, 92),
                ),
                SizedBox(width: 30.0),
                ButtonChooseLang(
                  mycolor: Color.fromARGB(255, 199, 199, 221),
                  mycolortext: Color.fromARGB(255, 84, 80, 92),
                  namelang: "Arabic",
                ),
              ],
            ),
            const SizedBox(height: 50.0),
            Image.asset(
              "images/ourlogo2.png",
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}
