import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutualhack/firebase_options.dart';
import 'package:mutualhack/language.dart';
import 'package:mutualhack/start.dart';
import 'package:mutualhack/view/auth/sign_in.dart';
import 'package:mutualhack/view/auth/sign_up.dart';
import 'package:mutualhack/view/homescreens/scan_qr_code.dart';
import 'package:mutualhack/view/onboardingview/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MutualHack',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified)
          ? const StartScreen()
          : const ChooseLang(),
      getPages: [
        GetPage(
          name: "/onboarding",
          page: () => const OnBoarding(),
        ),
        GetPage(
          name: "/signin",
          page: () => const SignIn(),
        ),
        GetPage(
          name: "/signup",
          page: () => const SignUp(),
        ),
        GetPage(name: "/start", page: () => const StartScreen()),
        GetPage(name: "/scan", page: () => const ScanCodeQr()),
      ],
    );
  }
}
