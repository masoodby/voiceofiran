import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../../utils/basic_screen_imports.dart';
import '../../../routes/routes.dart';
import '../../../backend/api/api.dart';

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

  Stream catData() {
    final api = ApiProvider();
    final apidata = api.getCategories();
    // print("our test $apidata");
    return apidata;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getCategoryData() {
    catData();

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

  goToCategoryPreviewScreen(data) async {
    final api = ApiProvider();
    final apiresponse = await api.getPrograms(data).then((value) => value);
    print(apiresponse["episodes"]);

    // final moein = jsonEncode(myProg);
    // print('do something $moein');
    // final json = jsonEncode(myProg);
    // print("mydata: $myProg");
    // Get.toNamed(
    //   Routes.detailsScreen,
    //   arguments: [
    //     {'streamUrl': mydata["url"]},
    //     {'imagePath': mydata["image"]},
    //     {'title': mydata["title"]},
    //     {'subTitle': ""},
    //     {'summary': mydata["summary"]},
    //     {'data': data},
    //   ],
    // );

    Get.toNamed(Routes.categoryPreviewScreen, arguments: {'data': apiresponse});
  }
}
