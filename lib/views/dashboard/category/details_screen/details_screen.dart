import '../../../../views/dashboard/category/details_screen/details_screen_mobile.dart';

import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ResponsiveLayout(mobileScaffold: DetailsScreenMobile());
  }
}