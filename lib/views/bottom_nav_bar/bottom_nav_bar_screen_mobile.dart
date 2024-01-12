import '../../controller/navigation/bottom_navbar_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/navigation/bottom_navigation_menu.dart';

class BottomNavBarScreenMobile extends StatelessWidget {
  BottomNavBarScreenMobile({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final BottomNavBarController bottomNavBarController =
        Get.put(BottomNavBarController(), permanent: false);
    return Obx(
      () => Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar:
            buildBottomNavigationMenu(context, bottomNavBarController),
        body: bottomNavBarController
            .page[bottomNavBarController.selectedIndex.value],
      ),
    );
  }
}