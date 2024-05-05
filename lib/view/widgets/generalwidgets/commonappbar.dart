import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarCommon extends StatelessWidget {
  final String title;

  const AppBarCommon({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color.fromARGB(255, 18, 91, 151),
              ),
            ),
            Text(
              title,
              style: GoogleFonts.mulish(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 28, 49, 188),
              ),
            ),
          ],
        ),
        Image.asset(
          "images/ourlogo2.png",
          width: 80.0,
        ),
      ],
    );
  }
}
