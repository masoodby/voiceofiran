import '../../../../views/dashboard/settings/settings_screen.dart';
import '../../utils/basic_screen_imports.dart';
import '../../views/dashboard/category/category_screen/category_screen.dart';
import '../../views/dashboard/home/home_screen.dart';

class BottomNavBarController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List page = [
    HomeScreen(),
    const CategoryScreen(),
    const SettingsScreen(),
  ];

  void selectedPage(int index) {
    selectedIndex.value = index;
  }
}