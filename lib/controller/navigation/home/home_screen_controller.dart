import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../utils/basic_screen_imports.dart';
import '../../../routes/routes.dart';

class HomeScreenController extends GetxController {
  Stream<QuerySnapshot<Map<String, dynamic>>> getBannerData() {
    return FirebaseFirestore.instance.collection("bannerSlider").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getLiveTvData() {
    return FirebaseFirestore.instance.collection("liveTv").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getPodcastData() {
    return FirebaseFirestore.instance.collection("livePodcast").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getCategoryData() {
    return FirebaseFirestore.instance.collection("categoriesData").snapshots();
  }

  var selectedPageIndex = 0.obs;

  goToCategoryScreen() {
    Get.toNamed(Routes.categoryScreen);
  }

  goToLivePodcastScreen() {
    Get.toNamed(Routes.livePodcastScreen);
  }

  goToSettingsScreen() {
    Get.toNamed(Routes.settingsScreen);
  }

  goToCategoryPreviewScreen(data) {
    Get.toNamed(Routes.categoryPreviewScreen, arguments: {'data': data});
  }
}