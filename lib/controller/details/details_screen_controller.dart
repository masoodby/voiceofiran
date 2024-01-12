import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';

class DetailsScreenController extends GetxController {

  goToVideoPlayerScreen(data) {
    Get.toNamed(Routes.videoPlayerScreen, arguments: [
      {'data': data},
    ]);
  }
}