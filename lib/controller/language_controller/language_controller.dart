import 'package:get/get.dart';

import '../../backend/local_storage/local_storage.dart';
import '../../language/english.dart';
import '../../utils/constants.dart';

class LanguageController extends GetxController {
  var selectedLanguage = "".obs;

  @override
  void onInit() {
    selectedLanguage.value = languageStateName;
    super.onInit();
  }

  onChangeLanguage(var language, int index) {
    selectedLanguage.value = language;
    if (index == 0) {
      LocalStorage.saveLanguage(
        langSmall: 'en',
        langCap: 'US',
        languageName: Strings.english,
      );
      languageStateName = Strings.english;
      update();
    } else if (index == 1) {
      LocalStorage.saveLanguage(
        langSmall: 'sp',
        langCap: 'SP',
        languageName: Strings.spanish,
      );
      languageStateName = Strings.spanish;
      update();
    } else if (index == 2) {
      LocalStorage.saveLanguage(
        langSmall: 'ar',
        langCap: 'AR',
        languageName: Strings.arabic,
      );
      languageStateName = Strings.arabic;
      update();
    }
  }

  final List<String> moreList = [
    Strings.english,
    Strings.spanish,
    Strings.arabic
  ];
}