import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Slides/slide_right.dart';
import '../../onboardingview/onboarding.dart';



class ButtonChooseLang extends StatelessWidget {
  final Color mycolor;
  final Color mycolortext;
  final String namelang;

  const ButtonChooseLang({
    super.key,
    required this.mycolor,
    required this.namelang, required this.mycolortext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: mycolor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: MaterialButton(
        onPressed: () {
          Navigator.of(context).push(SlideRight(page: const OnBoarding()));
        },
        elevation: 5.0,
        child: Text(
          namelang,
          style: GoogleFonts.abel(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: mycolortext,
          ),
        ),
      ),
    );
  }
}
