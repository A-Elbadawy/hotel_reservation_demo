import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:reservation_demo/utils/constants.dart';
import 'package:reservation_demo/utils/globals.dart';
import 'package:reservation_demo/utils/themes.dart';

class AppController extends GetxController {

  bool get isDark {
    return localStore.read(MyConstants.isDarkMode) ?? false;
  }

  void switchTheme() {
    isDarkMode = !isDark;
    myTheme = isDark ? MyThemes.lightTheme : MyThemes.darkTheme;
    Get.changeTheme(
        myTheme); // change the overall theme to get ColorScheme Changes on flutter widgets
    localStore.write(MyConstants.isDarkMode, !isDark);
    update();
    if (kDebugMode) {
      print("Theme updated and written to storage");
    }
  }
}
