import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';
import '../../../../views/dashboard/category/category_preview/category_preview_screen_mobile.dart';

class CategoryPreviewScreen extends StatelessWidget {
  const CategoryPreviewScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final data = Get.arguments; // Provide a default value if 'catName' is null

    return ResponsiveLayout(
      mobileScaffold: CategoryPreviewScreenMobile(
        data: data,
      ),
    );
  }
}