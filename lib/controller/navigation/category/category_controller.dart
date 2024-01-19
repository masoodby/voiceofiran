import '../../../../utils/basic_screen_imports.dart';
import '../../../routes/routes.dart';
import '../../../backend/api/api.dart';

class CategoryController extends GetxController {
  goToDetailsScreen(String streamUrl, String imagePath, String title,
      String subTitle, String summary, var data) async{
    final api = ApiProvider();
    final details = await api.getDetail(streamUrl).then((value) => value);
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
