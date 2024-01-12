import 'package:get/get.dart';

class VideoPlayerScreenController extends GetxController {
  RxString videoUrl = ''.obs;
  RxString title = ''.obs;
  RxString subTitle = ''.obs;
  RxBool isFullScreen = false.obs;
  RxBool showVideoPlayer = true.obs;
}