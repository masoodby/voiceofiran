import '../../routes/routes.dart';
import '../../utils/basic_screen_imports.dart';
import '../../backend/api/api.dart';
class DetailsScreenController extends GetxController {

  goToVideoPlayerScreen(data) {
    Get.toNamed(Routes.videoPlayerScreen, arguments: [
      {'data': data},
    ]);
  }


  goToDetailsScreen(data) async{
    final api = ApiProvider();
    final details = await api.getDetail(data["url"]).then((value) => value);
    // print("in controller $details");
    Get.toNamed(
      Routes.detailsScreen,
      arguments: [
        
        {'streamUrl': details['episode']['video']},
        {'imagePath': details['episode']['image']},
        {'title': details['episode']['title']},
        {'subTitle': ""},
        {'summary': details['episode']['content']},
        {'data': details['episode']},
        {'headTitle' : details["program"]["title"]},
      ],
    );
  }
}