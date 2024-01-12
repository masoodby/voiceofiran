import 'dart:async';

import 'package:iplive/backend/local_storage/local_storage.dart';

import '../routes/routes.dart';
import '../utils/basic_screen_imports.dart';
import '../utils/constants.dart';
//import '../service/firebase/firabase_init.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    //for new user need to uncomment this one by one and run the app after that comment again
    //await FirebaseInit.addBannerToFireStoreDatabase();
    //await FirebaseInit.addCategoryToFireStoreDatabase();
    //await FirebaseInit.addLiveTvToFireStoreDatabase();
    //await FirebaseInit.addLivePodcastToFireStoreDatabase();

    var languageList = LocalStorage.getLanguage();
    var locale = Locale(languageList[0], languageList[1]);

    languageStateName = languageList[2];

    Get.updateLocale(locale);
    _goToScreen();
  }

  _goToScreen() async {
    Timer(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.bottomNavigationBar);
    });
  }
}