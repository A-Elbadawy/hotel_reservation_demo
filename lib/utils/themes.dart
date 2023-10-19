import 'package:flutter/material.dart';
import 'package:reservation_demo/controller/app_controller.dart';

const appColorPrimary = Color(0xFF1882bf);

// Light Theme Colors
const appBackgroundColorLight = Color(0xFFe3f2fd); // == Colors.blue[50];
const primaryTextColorLight = Color(0xFF37474f); // == Colors.blueGrey[800];
const secondaryTextColorLight = Colors.blueGrey;

// Dark Theme Colors
const appBackgroundColorDark = Color(0xFF082B40);
const appBackgroundColorDark1 = Color(0xFF09334D);
const primaryTextColorDark = Colors.white;
const secondaryTextColorDark = Colors.white70;

Color get primaryTextColor =>
    isDarkMode ? primaryTextColorDark : primaryTextColorLight;

  ///
  bool isDarkMode = AppController().isDark;
  ThemeData myTheme = isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme;
  ThemeMode myThemeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;


  class MyThemes {
    Color lightPrimaryColor = const Color(0xFF0E1A2D);
    Color darkPrimaryColor = const Color(0xFFE0E6F3);
    Color lightBackgroundColor = const Color(0xFFEFEFEF);
    Color darkBackgroundColor = const Color(0xFF171717);
    Color blackColor = const Color(0xFF000000);
    Color whiteColor = const Color(0xFFFFFFFF);
    Color secondaryBackgroundDarkColor = const Color(0xFF2D2D2D);
    Color secondaryBackgroundLightColor = const Color(0xFFE9E9E9);
    Color secondaryTextLightColor = const Color(0xFF4C4C4C);
    Color secondaryTextDarkColor = const Color(0xFF9A9A9A);
    Color topBarBSDarkColor = const Color(0xFFB8B3B8).withOpacity(0.8);
    Color topBarBSLightColor = const Color(0xFF938F93).withOpacity(0.8);
    Color hotelCardLightColor = const Color(0xFFEEEEEE);
    Color hotelCardDarkColor = const Color(0xFF1E1E1E);
    Color offWhiteColor = const Color(0xFFDEDEDE);


    Color get primaryButtonColor =>
        isDarkMode ? darkPrimaryColor : lightPrimaryColor;
    Color get primaryTextColor =>
        isDarkMode ? lightPrimaryColor : darkPrimaryColor;
    Color get elevatedButtonColor =>
        isDarkMode ? darkPrimaryColor : lightBackgroundColor;
    Color get backgroundColor =>
        isDarkMode ? darkBackgroundColor : lightBackgroundColor;
    Color get blackWhiteColor =>
        isDarkMode ? whiteColor : blackColor;
    Color get blackWhiteBackgroundColor =>
        isDarkMode ? blackColor : whiteColor;
    Color get secondaryBackgroundColor =>
        isDarkMode ? secondaryBackgroundDarkColor : secondaryBackgroundLightColor;
    Color get secondaryTextColor =>
        isDarkMode ? secondaryTextDarkColor : secondaryTextLightColor;
    Color get topBarBSColor =>
        isDarkMode ? topBarBSDarkColor : topBarBSLightColor;
    Color get hotelCardColor =>
        isDarkMode ? hotelCardDarkColor : hotelCardLightColor;
    Color get detailsCardColor =>
        isDarkMode ? secondaryBackgroundDarkColor : offWhiteColor;

    ///
    static ThemeData lightTheme = ThemeData(
        primaryColor: ThemeData.light().scaffoldBackgroundColor,
      colorScheme: const ColorScheme.light().copyWith(
        primary: _myThemes.lightPrimaryColor,
        background: _myThemes.backgroundColor,
        brightness: ThemeData.light().brightness
      )
        );

    ///
    static ThemeData darkTheme = ThemeData(
        primaryColor: ThemeData.dark().scaffoldBackgroundColor,
        colorScheme: const ColorScheme.dark().copyWith(
          primary: _myThemes.darkPrimaryColor,
        )
    );
}
MyThemes _myThemes = MyThemes();