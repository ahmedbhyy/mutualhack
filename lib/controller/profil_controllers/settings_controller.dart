import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../view/profil_screen/settingspages/change_pass.dart';
import '../../view/profil_screen/settingspages/help.dart';
import '../../view/profil_screen/settingspages/language.dart';
import '../../view/profil_screen/settingspages/privacy.dart';

abstract class SettingsControllerProfil extends GetxController {
  updateswitcher(bool switcher);
}

class SettingsControllerProfilImp extends SettingsControllerProfil {
  bool notification = true;

  List<String> settingsprofil = [
    "Changer le mot de passe",
    "Modifier la Langue",
    "Confidentialité",
    "Signaler un probléme",
  ];

  List<Icon> myicons = [
    const Icon(Icons.key_rounded),
    const Icon(Icons.language),
    const Icon(Icons.privacy_tip_outlined),
    const Icon(Icons.report),
  ];

  List<Widget> mywidgets = [
    const ChangePassword(),
    const Language(),
    const Privacy(),
    const HelpSettings(),
  ];

  @override
  updateswitcher(switcher) {
    notification = switcher;
    update();
  }
}
