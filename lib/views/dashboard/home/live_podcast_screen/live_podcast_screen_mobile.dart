import 'package:cached_network_image/cached_network_image.dart';
import 'package:iplive/main.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../controller/details/details_screen_controller.dart';
import '../../../../controller/navigation/home/home_screen_controller.dart';
import '../../../../controller/video_player_screen_controller/video_player_screen_controller.dart';
import '../../../../utils/basic_screen_imports.dart';

class LivePodcastScreenMobile extends StatelessWidget {
  LivePodcastScreenMobile({super.key});

  final homeController = Get.put(HomeScreenController());
  final detailsController = Get.put(DetailsScreenController());
  final videoPlayerController = Get.put(VideoPlayerScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleHeading4Widget(
          text: Strings.livePodcast.tr,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(children: [
      _livePodcastGridWidget(context),
    ]);
  }

  _livePodcastGridWidget(BuildContext context) {
    return StreamBuilder(
      stream: homeController.getPodcastData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: TitleHeading4Widget(
              text: Strings.errorLoadingData,
              color: CustomColor.blackColor,
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: TitleHeading4Widget(
              text: Strings.loading,
              color: CustomColor.blackColor,
            ),
          );
        }
        if (!snapshot.hasData) {
          return const Center(
            child: TitleHeading4Widget(
              text: Strings.noDataAvailable,
              color: CustomColor.blackColor,
            ),
          );
        }
        return SizedBox(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              var data = snapshot.data!.docs;
              String podcastBannerImageUrl = data[index]["banner"].toString();
              String podcastTitle = data[index]["title"].toString();
              String podcastSubTitle = data[index]["subTitle"].toString();

              return InkWell(
                onTap: () {
                  videoPlayerController.videoUrl.value =
                      data[index]["url"].toString();
                  videoPlayerController.title.value =
                      data[index]["title"].toString();
                  videoPlayerController.subTitle.value =
                      data[index]["subTitle"].toString();
                  detailsController.goToVideoPlayerScreen(data);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: Dimensions.paddingSize * 0.6,
                    right: Dimensions.paddingSize * 0.6,
                    bottom: Dimensions.paddingSize * .5,
                    top: Dimensions.paddingSize * 0.5,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSize * .3),
                          height: DeviceInfo.isTv
                              ? MediaQuery.of(context).size.height * 0.18
                              : MediaQuery.of(context).size.height * 0.08,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: podcastBannerImageUrl,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              // Choose your shimmer base color
                              highlightColor: Colors.grey[100]!,
                              // Choose your shimmer highlight color
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                color: Colors
                                    .white, // You can change this color as needed
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: crossStart,
                          children: [
                            TitleHeading5Widget(
                              text: podcastTitle,
                              fontWeight: FontWeight.w600,
                              fontSize: DeviceInfo.isTv
                                  ? Dimensions.headingTextSize6
                                  : Dimensions.headingTextSize3,
                              color: Get.isDarkMode
                                  ? CustomColor.whiteColor.withOpacity(0.65)
                                  : CustomColor.blackColor
                                  .withOpacity(0.65),
                            ),
                            verticalSpace(DeviceInfo.isTv
                                ? Dimensions.heightSize * 1.5
                                : Dimensions.heightSize * 0.5),
                            TitleHeading5Widget(
                              text: podcastSubTitle,
                              color: Get.isDarkMode
                                  ? CustomColor.whiteColor.withOpacity(0.3)
                                  : CustomColor.blackColor.withOpacity(0.3),
                              fontWeight: FontWeight.w600,
                              fontSize: DeviceInfo.isTv
                                  ? Dimensions.headingTextSize7
                                  : Dimensions.headingTextSize4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}