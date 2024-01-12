import '../../../../views/dashboard/home/home_screen_mobile.dart';

import '../../../controller/navigation/home/home_screen_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(mobileScaffold: HomeScreenMobile());
  }
}