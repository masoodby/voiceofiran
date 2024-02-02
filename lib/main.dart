import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:dio/dio.dart';
import '../../../routes/routes.dart';
import '../../../utils/theme.dart';
import 'firebase_options.dart';
// import 'helper/admob_helper.dart';
import 'language/english.dart';
import 'language/local_string.dart';

class DeviceInfo {
  static bool isTv = false;
}

Future<void> checkAndSetIsAndroidTV() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo;
  try {
    androidInfo = await deviceInfo.androidInfo;
    DeviceInfo.isTv =
        androidInfo.systemFeatures.contains('android.software.leanback');
  } catch (e) {
    // Handle errors if needed
    DeviceInfo.isTv = false;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).whenComplete(() {
    debugPrint('FIREBASE INITIALIZED================>');
  });

  // Determine if the app is running on a TV
  await checkAndSetIsAndroidTV();

  // Set preferred screen orientations based on the platform
  SystemChrome.setPreferredOrientations([
    DeviceInfo.isTv
        ? DeviceOrientation.landscapeLeft
        : DeviceOrientation.portraitUp,
    DeviceInfo.isTv
        ? DeviceOrientation.landscapeRight
        : DeviceOrientation.portraitDown,
  ]);
  await GetStorage.init();
  // AdMobHelper.initialization();
  // main app
  runApp(const MyApp());
}

// This widget is the root of your application.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
      },
      child: ScreenUtilInit(
        designSize: const Size(1920, 1080),
        builder: (_, child) => GetMaterialApp(
          title: Strings.appName,
          debugShowCheckedModeBanner: false,
          theme: Themes.light,
          darkTheme: Themes.dark,
          themeMode: Themes().theme,
          navigatorKey: Get.key,
          initialRoute: Routes.splashScreen,
          getPages: Routes.list,
          translations: LocalString(),
          locale: const Locale('en', 'EN'),
          builder: (context, widget) {
            ScreenUtil.init(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
        ),
      ),
    );
  }
}
