import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';

import '../../../../controller/video_player_screen_controller/video_player_screen_controller.dart';
import '../../../../helper/admob_helper.dart';
import '../../../../main.dart';
import '../../../../routes/routes.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/others/video_player_view.dart';

class VideoPlayerScreenMobile extends StatelessWidget {
  VideoPlayerScreenMobile({super.key});

  final controller = Get.put(VideoPlayerScreenController());

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = ModalRoute.of(context)?.settings.arguments;

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
      ),
      body: Obx(
        () {
          if (arguments == null) {
            return const Center(
              child: TitleHeading4Widget(
                text: Strings.errorInvalidOrMissingArgument,
              ),
            );
          }
          return _bodyWidget(
            context,
            arguments[0]["data"],
          );
        },
      ),
    );
  }

  Widget _bodyWidget(BuildContext context, var data) {
    if (controller.videoUrl.isEmpty) {
      return const Center(
        child: TitleHeading4Widget(
          text: Strings.errorInvalidStreamUrl,
        ),
      );
    } else {
      return Column(
        children: [
          SizedBox(
            height: DeviceInfo.isTv
                ? MediaQuery.of(context).size.height * 0.59
                : MediaQuery.of(context).size.height * 0.5,
            child: VideoPlayerView(
              url: controller.videoUrl.value,
              dataSourceType: DataSourceType.network,
            ),
          ),
          _gridWidget(context, data),
          SizedBox(
            height: Dimensions.heightSize * 3.8,
            child: AdWidget(
              ad: AdMobHelper.getBannerAd()..load(),
              key: UniqueKey(),
            ),
          ),
        ],
      );
    }
  }

  Widget _gridWidget(BuildContext context, data) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.24,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              controller.showVideoPlayer.value = true;
              controller.videoUrl.value = data['url'];
              controller.title.value = data['title'];
              controller.subTitle.value = "";
              final videoPlayerController =
                  Get.put(VideoPlayerScreenController());
              videoPlayerController.videoUrl.value =
                  data['url'].toString();
              Get.back();
              Get.toNamed(
                Routes.videoPlayerScreen,
                arguments: [
                  {'data': data},
                ],
              );
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: Dimensions.paddingSize * 0.6,
                right: Dimensions.paddingSize * 0.6,
                //bottom: Dimensions.paddingSize * .4,
                top: Dimensions.paddingSize * 0.4,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSize * .3),
                    height: MediaQuery.of(context).size.height * 0.14,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: data['image'],
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        // Choose your shimmer base color
                        highlightColor: Colors.grey[100]!,
                        // Choose your shimmer highlight color
                        child: Container(
                          // width: double.infinity,
                          // height: double.infinity,
                          color: Colors
                              .white, // You can change this color as needed
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  verticalSpace(Dimensions.heightSize * .75),
                  Column(
                    crossAxisAlignment: crossCenter,
                    children: [
                      TitleHeading5Widget(
                        text: data['title'],
                        fontSize: DeviceInfo.isTv
                            ? Dimensions.headingTextSize8
                            : Dimensions.headingTextSize4,
                        fontWeight: FontWeight.w600,
                        color: Get.isDarkMode
                            ? CustomColor.whiteColor.withOpacity(0.65)
                            : CustomColor.blackColor.withOpacity(0.65),
                      ),
                      verticalSpace(Dimensions.heightSize * .25),
                      TitleHeading5Widget(
                        text: "",
                        fontSize: DeviceInfo.isTv
                            ? Dimensions.headingTextSize8
                            : Dimensions.headingTextSize5,
                        color: Get.isDarkMode
                            ? CustomColor.whiteColor.withOpacity(0.3)
                            : CustomColor.blackColor.withOpacity(0.3),
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}