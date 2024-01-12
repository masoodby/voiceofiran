import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';
import '../../../../widgets/others/custom_image_widget.dart';
import '../../custom_assets/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSize),
            child: CustomImageWidget(
              path: Get.isDarkMode
                  ? Assets.logo.basicLogoDark.path
                  : Assets.logo.basicLogoLight.path,
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
            ),
          ),
        ),
      ),
    );
  }
}