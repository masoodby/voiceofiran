import '../../views/bottom_nav_bar/bottom_nav_bar_screen_mobile.dart';

import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: BottomNavBarScreenMobile(),
    );
  }
}