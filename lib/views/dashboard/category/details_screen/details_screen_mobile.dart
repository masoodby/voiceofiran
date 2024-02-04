import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
// import '../../../../widgets/webview/webview.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:iplive/widgets/others/video_player_view.dart';
// import 'package:video_player/video_player.dart';
import '../../../../controller/details/details_screen_controller.dart';
import '../../../../controller/video_player_screen_controller/video_player_screen_controller.dart';
// import '../../../../helper/admob_helper.dart';
import '../../../../main.dart';
import '../../../../utils/basic_screen_imports.dart';
// import '../../../../widgets/others/custom_title_subtitle_widget.dart';

class DetailsScreenMobile extends StatelessWidget {
  final controller = Get.put(DetailsScreenController());
  final videoPlayerController = Get.put(VideoPlayerScreenController());

  DetailsScreenMobile({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    final arguments = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: const TitleHeading3Widget(
          text: Strings.details,
        ),
      ),
      body: _bodyWidget(context, arguments),
    );
  }

  _bodyWidget(BuildContext context, var arguments) {
    return ListView(
      children: [
        _imageWidget(context, arguments),
        //as there is no authentication till now so uid can't be used so this favourite part is on hold for now
        // _titleSubtitleFavouriteWidget(context, arguments),
        _titleSubtitleWidget(context, arguments),
        _detailsTitleSubtitleWidget(context, arguments),
      ],
    );
  }

  _imageWidget(BuildContext context, var arguments) {
    final imagePath = arguments[1]["imagePath"];
    var data = arguments[5]["data"];
    return Stack(
      children: [
        SizedBox(
          height: DeviceInfo.isTv
              ? MediaQuery.of(context).size.height * .60
              : MediaQuery.of(context).size.height * .25,
          child: CachedNetworkImage(
            imageUrl: imagePath!,
            maxWidthDiskCache: 1024 * 2,
            maxHeightDiskCache: 1024 * 2,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              // Choose your shimmer base color
              highlightColor: Colors.grey[100]!,
              // Choose your shimmer highlight color
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.white, // You can change this color as needed
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        Positioned(
          bottom: DeviceInfo.isTv
              ? MediaQuery.of(context).size.height * .25
              : MediaQuery.of(context).size.height * .1,
          left: DeviceInfo.isTv
              ? MediaQuery.sizeOf(context).width * .40
              : MediaQuery.sizeOf(context).width * .3,
          child: InkWell(
            onTap: () {
              // AdMobHelper.getInterstitialAdLoad();
              videoPlayerController.videoUrl.value = arguments[0]["streamUrl"];
              videoPlayerController.title.value = arguments[2]["title"];
              videoPlayerController.subTitle.value = arguments[3]["subTitle"];
              controller.goToVideoPlayerScreen(data);
            },
            child: Container(
              padding: EdgeInsets.all(Dimensions.paddingSize * .25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius * 2.5),
                color: CustomColor.blackColor.withOpacity(.5),
              ),
              // child: Row(
              //   children: [
              //     CircleAvatar(
              //       radius: Dimensions.radius * 2,
              //       child: const Icon(
              //         Icons.play_arrow,
              //       ),
              //     ),
              //     TitleHeading4Widget(
              //       padding: EdgeInsets.symmetric(
              //           horizontal: Dimensions.paddingSize * .25),
              //       text: Strings.playNow,
              //       color: CustomColor.whiteColor,
              //     )
              //   ],
              // ),
            ),
          ),
        ),
      ],
    );
  }

  _detailsTitleSubtitleWidget(BuildContext context, arguments) {
    // toutube player controller
   
     String? videoId;
    videoId = YoutubePlayer.convertUrlToId("https://${arguments[0]["streamUrl"]}" ?? "https://www.youtube.com/embed/mnEmwq_rsLw");
    print("videoId $videoId"); // BBAyRBTfsOU

    final YoutubePlayerController youtubeController = YoutubePlayerController(

      initialVideoId: videoId ?? "mnEmwq_rsLw" ,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );   

   // BBAyRBTfsOU
    print(arguments[0]["streamUrl"]);
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.paddingSize,
        right: Dimensions.paddingSize,
      ),
      child:  SizedBox(
          width: 200,
          height: 200,
          // child: WebView(video:arguments[0]["streamUrl"]),
          child: YoutubePlayer(
            controller: youtubeController,
             bottomActions: [
            CurrentPosition(),
            ProgressBar(isExpanded: true),            
            ],)
            ),
    );
  }

  _titleSubtitleWidget(BuildContext context, var arguments) {
    final title = arguments[2]["title"];
    final subTitle = arguments[3]["subTitle"];
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize,
          vertical: Dimensions.paddingSize * .75),
      child: Column(
        children: [
          TitleHeading3Widget(text: title),
          TitleHeading4Widget(text: subTitle),
          Divider(
            height: Dimensions.heightSize,
            color: CustomColor.blackColor.withOpacity(.25),
          )
        ],
      ),
    );
  }
}
