

import '../../../../views/dashboard/category/category_screen/category_screen_mobile.dart';

import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ResponsiveLayout(mobileScaffold: CategoryScreenMobile());
  }
}