import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_color.dart';

class Themes {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }

  static final light = ThemeData.light().copyWith(
    useMaterial3: true,
    primaryColor: CustomColor.primaryLightColor,
    dividerColor: CustomColor.blackColor.withOpacity(.1),
    // ignore: deprecated_member_use
    backgroundColor: CustomColor.primaryBGLightColor,
    scaffoldBackgroundColor: CustomColor.primaryLightScaffoldBackgroundColor,
    brightness: Brightness.light,
    textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: CustomColor.blackColor,
          fontFamily: GoogleFonts.josefinSans().fontFamily,
        ),
    appBarTheme: const AppBarTheme(
      backgroundColor: CustomColor.whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(color: CustomColor.blackColor),
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    useMaterial3: true,
    primaryColor: CustomColor.primaryDarkColor,
    dividerColor: CustomColor.primaryBGLightColor.withOpacity(.5),
    // ignore: deprecated_member_use
    backgroundColor: CustomColor.primaryBGDarkColor,
    scaffoldBackgroundColor: CustomColor.primaryDarkScaffoldBackgroundColor,
    brightness: Brightness.dark,
    textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: Colors.white,
          fontFamily: GoogleFonts.josefinSans().fontFamily,
        ),
    appBarTheme: const AppBarTheme(
      backgroundColor: CustomColor.primaryBGDarkColor,
      elevation: 0,
      iconTheme: IconThemeData(color: CustomColor.whiteColor),
    ),
  );
}