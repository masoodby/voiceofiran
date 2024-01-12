
import '../../../../views/dashboard/category/video_player_screen/video_player_screen_mobile.dart';

import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   ResponsiveLayout(mobileScaffold: VideoPlayerScreenMobile());
  }
}