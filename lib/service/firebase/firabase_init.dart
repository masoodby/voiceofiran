import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../firebase_model_data/banner_data.dart';
import '../firebase_model_data/category_data.dart';
import '../firebase_model_data/live_podcast_data.dart';
import '../firebase_model_data/live_tv_data.dart';

class FirebaseInit {
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  static Future<void> addBannerToFireStoreDatabase() async {
    try {
      final ref = _fireStore.collection('bannerSlider');

      final doc = await ref.doc().get();

      debugPrint("${doc.exists} banner data---------------");
      if (!doc.exists) {
        for (var element in bannerData) {
          await ref.doc().set({
            "banner_image": element.bannerImage,
            "banner_link": element.bannerLink,
            "visibility": element.visibility,
          });
        }
        debugPrint(
            '-----successfully added banner data for home banner !---------');
      } else {
        debugPrint(
            '----------already added banner data for home banner !------');
      }
    } catch (e) {
      debugPrint('Error adding home banner  to Firestore: $e');
    }
  }

  //add live tv to firebase
  static Future<void> addLiveTvToFireStoreDatabase() async {
    try {
      final ref = _fireStore.collection('liveTv');

      final doc = await ref.doc().get();

      debugPrint("${doc.exists} live tv data---------------");
      if (!doc.exists) {
        for (var element in liveTvData) {
          await ref.doc().set({
            "banner": element.liveTvImage,
            "url": element.liveTvUrl,
            "title": element.title,
            "subTitle": element.subTitle,
            "visibility": element.visibility,
          });
        }
        debugPrint(
            '-----successfully added live tv  data for live tv  !---------');
      } else {
        debugPrint('----------already added live tv  data for live tv !------');
      }
    } catch (e) {
      debugPrint('Error adding live tv to Firestore: $e');
    }
  }

  //live podcast data
  static Future<void> addLivePodcastToFireStoreDatabase() async {
    try {
      final ref = _fireStore.collection('livePodcast');

      final doc = await ref.doc().get();

      debugPrint("${doc.exists} livePodcastData---------------");
      if (!doc.exists) {
        for (var element in livePodcastData) {
          await ref.doc().set({
            "title": element.title,
            "subTitle": element.subTitle,
            "url": element.url,
            "banner": element.banner,
            "visibility": element.visibility,
          });
        }

        debugPrint(
            '-----successfully added-livePodcastData for live podcast !---------');
      } else {
        debugPrint(
            '----------already added-livePodcastData for live podcast !------');
      }
    } catch (e) {
      debugPrint('Error adding home banner  to Firestore: $e');
    }
  }

  //category
  static Future<void> addCategoryToFireStoreDatabase() async {
    try {
      final ref = _fireStore.collection('categoriesData');

      final doc = await ref.doc().get();

      debugPrint("${doc.data().toString()} category data---------------");

      for (var element in categoriesData) {
        await ref.doc().set({
          "name": element.name,
          "banner": element.banner,
          "visibility": element.visibility,
          "data": element.data.toList(),
        });
      }
      debugPrint(
          '-----successfully added category data for categories !---------');
    } catch (e) {
      debugPrint('Error adding home category  to Firestore: $e');
    }
  }
}