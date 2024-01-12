



import '../../../../views/dashboard/home/live_podcast_screen/live_podcast_screen_mobile.dart';

import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';

class LivePodcastScreen extends StatelessWidget {
  const LivePodcastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   ResponsiveLayout(mobileScaffold: LivePodcastScreenMobile());
  }
}