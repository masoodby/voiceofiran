import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

const String language = "language";
const String smallLanguage = "smallLanguage";
const String capitalLanguage = "capitalLanguage";

class LocalStorage {
  static Future<void> saveLanguage({
    required String langSmall,
    required String langCap,
    required String languageName,
  }) async {
    final box1 = GetStorage();
    final box2 = GetStorage();
    final box3 = GetStorage();

    var locale = Locale(langSmall, langCap);
    Get.updateLocale(locale);
    await box1.write(smallLanguage, langSmall);
    await box2.write(capitalLanguage, langCap);
    await box3.write(language, languageName);

    Get.updateLocale(locale);
  }

  static List getLanguage() {
    String small = GetStorage().read(smallLanguage) ?? 'en';
    String capital = GetStorage().read(capitalLanguage) ?? 'US';
    String languages = GetStorage().read(language) ?? 'English';
    return [small, capital, languages];
  }
}