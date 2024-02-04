import '../../../../routes/routes.dart';
import '../backend/config/app_config.dart';
import '../language/english.dart';
import '../views/dashboard/category/category_screen/category_screen.dart';
import 'package:get/get.dart';

import '../bindings/splash_screen_binding.dart';
import '../views/bottom_nav_bar/bottom_nav_bar.dart';
import '../views/dashboard/category/category_preview/category_preview_screeen.dart';
import '../views/dashboard/category/details_screen/details_screen.dart';
import '../views/dashboard/category/video_player_screen/video_player_screen.dart';
import '../views/dashboard/home/live_podcast_screen/live_podcast_screen.dart';
import '../views/dashboard/settings/settings_screen.dart';
import '../views/example/example.dart';
import '../views/splash_screen/splash_screen.dart';
// import '../widgets/others/in_app_web_view_widget.dart';

class RoutePageList {
  static var list = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.exampleScreen,
      page: () => ExampleScreen(),
    ),
    GetPage(
      name: Routes.bottomNavigationBar,
      page: () => const BottomNavBarScreen(),
    ),
    GetPage(
      name: Routes.livePodcastScreen,
      page: () => const LivePodcastScreen(),
    ),
    GetPage(
      name: Routes.categoryScreen,
      page: () => const CategoryScreen(),
    ),
    GetPage(
      name: Routes.settingsScreen,
      page: () => const SettingsScreen(),
    ),
    GetPage(
      name: Routes.videoPlayerScreen,
      page: () => const VideoPlayerScreen(),
    ),
    GetPage(
      name: Routes.categoryPreviewScreen,
      page: () => const CategoryPreviewScreen(),
    ),  GetPage(
      name: Routes.detailsScreen,
      page: () => const DetailsScreen(),
    ),
    // GetPage(
    //   name: Routes.privacyPolicy,
    //   page: () => WebViewScreen(
    //     title: Strings.privacyAndPolicy,
    //     url: AppConfig.policyLink,
    //   ),
    // ),
    //about us
    // GetPage(
    //   name: Routes.aboutUs,
    //   page: () => WebViewScreen(
    //     title: Strings.aboutUs,
    //     url: AppConfig.aboutUsLink,
    //   ),
    // ),
  ];
}