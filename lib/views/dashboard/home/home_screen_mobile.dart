// ignore_for_file: unnecessary_string_interpolations

// import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';

import 'package:iplive/main.dart';
import 'package:iplive/widgets/others/video_player_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';
// import '../category/details_screen/details_screen_mobile.dart';
import '../../../../controller/navigation/home/home_screen_controller.dart';
import '../../../controller/details/details_screen_controller.dart';
import '../../../controller/video_player_screen_controller/video_player_screen_controller.dart';
// import '../../../helper/admob_helper.dart';
import '../../../utils/basic_screen_imports.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key, required});

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  final controller = Get.put(HomeScreenController());
  final detailsController = Get.put(DetailsScreenController());
  final videoPlayerController = Get.put(VideoPlayerScreenController());


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleHeading5Widget(
          text: Strings.home.tr,
          fontSize: DeviceInfo.isTv
              ? Dimensions.headingTextSize5
              : Dimensions.headingTextSize3,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(context) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.getBannerData();
        controller.mainStream();
        controller.getPodcastData();
      },
      child: ListView(
        children: [
          _bannerWidget(context),
          _liveTvTextWidget(context),
          // _liveTvWidget(context),
          // _livePodcastTextWidget(context),
          _livePodcastWidget(context)
        ],
      ),
    );
  }

  _bannerWidget(context) {
    return StreamBuilder(
      stream: controller.mainStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text(
              "Error loading data",
              style: TextStyle(
                color: CustomColor.blackColor,
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text(
              "Loading",
              style: TextStyle(
                color: CustomColor.blackColor,
              ),
            ),
          );
        }
        if (!snapshot.hasData) {
          return const Center(
            child: Text(
              "No data available",
              style: TextStyle(color: CustomColor.blackColor),
            ),
          );
        } else {
          return  SizedBox(
            child: VideoPlayerView(              
              url: snapshot.data!["url"],
              dataSourceType: DataSourceType.network,
            ),
          );
        }
      },
    );
  }

  _liveTvTextWidget(context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.paddingSize,
          right: Dimensions.paddingSize,
          top: Dimensions.paddingSize,
          bottom: Dimensions.paddingSize * .5),
      child: TitleHeading5Widget(
        text: Strings.liveTv.tr,
        fontWeight: FontWeight.w600,
        fontSize: DeviceInfo.isTv
            ? Dimensions.headingTextSize5
            : Dimensions.headingTextSize2,
      ),
    );
  }

  // _liveTvWidget(context) {
  //   return StreamBuilder(
  //     stream: controller.getLiveTvData(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasError) {
  //         return const Center(
  //           child: Text("Error loading data",
  //               style: TextStyle(color: CustomColor.blackColor)),
  //         );
  //       }
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return const Center(
  //           child: Text("Loading",
  //               style: TextStyle(color: CustomColor.blackColor)),
  //         );
  //       }
  //       if (!snapshot.hasData) {
  //         return const Center(
  //           child: Text(
  //             "No data available",
  //             style: TextStyle(color: CustomColor.blackColor),
  //           ),
  //         );
  //       }
  //       return SizedBox(
  //         height: DeviceInfo.isTv
  //             ? MediaQuery.of(context).size.height * 0.25
  //             : MediaQuery.of(context).size.height *
  //                 0.12, //adjust live tv item height
  //         child: ListView.builder(
  //           physics: const BouncingScrollPhysics(),
  //           scrollDirection: Axis.horizontal,
  //           shrinkWrap: true,
  //           itemCount: snapshot.data!.docs.length,
  //           itemBuilder: (BuildContext context, int index) {
  //             var data = snapshot.data!.docs;
  //             String liveTvImageUrl = data[index]["banner"].toString();

  //             return InkWell(
  //               onTap: () {
  //                 videoPlayerController.videoUrl.value =
  //                     data[index]["url"].toString();
  //                 videoPlayerController.title.value =
  //                     data[index]["title"].toString();
  //                 videoPlayerController.subTitle.value =
  //                     data[index]["subTitle"].toString();
  //                 detailsController.goToVideoPlayerScreen(data);
  //               },
  //               child: Container(
  //                 margin: EdgeInsets.symmetric(
  //                     horizontal: Dimensions.paddingSize * .25),
  //                 width: MediaQuery.of(context).size.width * .35,
  //                 child: SizedBox(
  //                   height: MediaQuery.of(context).size.height / 4,
  //                   width: MediaQuery.of(context).size.width,
  //                   child: CachedNetworkImage(
  //                     imageUrl: liveTvImageUrl,
  //                     maxHeightDiskCache: 512 * snapshot.data!.docs.length,
  //                     maxWidthDiskCache: 512 * snapshot.data!.docs.length,
  //                     fit: BoxFit.cover,
  //                     placeholder: (context, url) => Shimmer.fromColors(
  //                       baseColor: Colors.grey[300]!,
  //                       // Choose your shimmer base color
  //                       highlightColor: Colors.grey[100]!,
  //                       // Choose your shimmer highlight color
  //                       child: Container(
  //                         width: double.infinity,
  //                         height: double.infinity,
  //                         color: Colors
  //                             .white, // You can change this color as needed
  //                       ),
  //                     ),
  //                     errorWidget: (context, url, error) =>
  //                         const Icon(Icons.error),
  //                   ),
  //                 ),
  //               ),
  //             );
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }

  // _livePodcastTextWidget(context) {
  //   return Padding(
  //     padding: EdgeInsets.only(
  //         left: Dimensions.paddingSize,
  //         right: Dimensions.paddingSize,
  //         top: Dimensions.paddingSize,
  //         bottom: Dimensions.paddingSize * .3),
  //     child: Row(
  //       mainAxisAlignment: mainSpaceBet,
  //       children: [
  //         TitleHeading5Widget(
  //           text: Strings.livePodcast.tr,
  //           fontWeight: FontWeight.w600,
  //           fontSize: DeviceInfo.isTv
  //               ? Dimensions.headingTextSize5
  //               : Dimensions.headingTextSize2,
  //         ),
  //         InkWell(
  //           onTap: () {
  //             controller.goToLivePodcastScreen();
  //           },
  //           child: TitleHeading5Widget(
  //             text: Strings.viewMore.tr,
  //             fontSize: DeviceInfo.isTv
  //                 ? Dimensions.headingTextSize7
  //                 : Dimensions.headingTextSize6,
  //             color: CustomColor.primaryLightColor,
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  _livePodcastWidget(context) {
    return StreamBuilder(
      stream: controller.homeApi(),
      builder: (context, snapshot) {
        // print("homescreen api: ${snapshot.data}");
        if (snapshot.hasError) {
          return const Center(
            child: Text("Error loading data",
                style: TextStyle(color: CustomColor.blackColor)),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text("Loading",
                style: TextStyle(color: CustomColor.blackColor)),
          );
        }
        if (!snapshot.hasData) {
          return const Center(
            child: Text(
              "No data available",
              style: TextStyle(color: CustomColor.blackColor),
            ),
          );
        }
        return SingleChildScrollView(
          child: SizedBox(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data!.length > 5 ? 5 : snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data;
                String podcastBannerImageUrl = data[index]["image"].toString();
                String podcastTitle = data[index]["title"].toString();
                String podcastSubTitle = "";
                //String podcastUrl = data[index]["url"].toString();
                return InkWell(
                  onTap: () async {
                    videoPlayerController.videoUrl.value =
                        data[index]["url"].toString();
                    videoPlayerController.title.value =
                        data[index]["title"].toString();
                    videoPlayerController.subTitle.value = "";
                    await detailsController.goToDetailsScreen(data[index]);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: Dimensions.paddingSize * 0.6,
                      right: Dimensions.paddingSize * 0.6,
                      bottom: Dimensions.paddingSize * .5,
                      top: Dimensions.paddingSize * 0.5,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: Dimensions.paddingSize * .3),
                                height: DeviceInfo.isTv
                                    ? MediaQuery.of(context).size.height * 0.18
                                    : MediaQuery.of(context).size.height * 0.08,
                                //adjust live podcast individual item height
                                child: CachedNetworkImage(
                                  imageUrl: podcastBannerImageUrl,
                                  // maxHeightDiskCache: 512 *
                                  //     (snapshot.data!.docs.length > 5
                                  //         ? 5
                                  //         : snapshot.data!.docs.length),
                                  // maxWidthDiskCache: 512 *
                                  //     (snapshot.data!.docs.length > 5
                                  //         ? 5
                                  //         : snapshot.data!.docs.length),
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
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
                                        ? CustomColor.whiteColor
                                            .withOpacity(0.65)
                                        : CustomColor.blackColor
                                            .withOpacity(0.65),
                                  ),
                                  verticalSpace(DeviceInfo.isTv
                                      ? Dimensions.heightSize * 1.5
                                      : Dimensions.heightSize * 0.5),
                                  TitleHeading5Widget(
                                    text: podcastSubTitle,
                                    color: Get.isDarkMode
                                        ? CustomColor.whiteColor
                                            .withOpacity(0.3)
                                        : CustomColor.blackColor
                                            .withOpacity(0.3),
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
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
