import '../../../../utils/basic_screen_imports.dart';
import '../../../routes/routes.dart';

class CategoryController extends GetxController {
  goToDetailsScreen(String streamUrl, String imagePath, String title,
      String subTitle, String summary, var data) {
    Get.toNamed(
      Routes.detailsScreen,
      arguments: [
        {'streamUrl': streamUrl},
        {'imagePath': imagePath},
        {'title': title},
        {'subTitle': subTitle},
        {'summary': summary},
        {'data': data},
      ],
    );
  }
}