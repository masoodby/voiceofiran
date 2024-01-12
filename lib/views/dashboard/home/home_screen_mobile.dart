import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:iplive/main.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../controller/navigation/home/home_screen_controller.dart';
import '../../../controller/details/details_screen_controller.dart';
import '../../../controller/video_player_screen_controller/video_player_screen_controller.dart';
import '../../../helper/admob_helper.dart';
import '../../../utils/basic_screen_imports.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

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
        controller.getLiveTvData();
        controller.getPodcastData();
      },
      child: ListView(
        children: [
          _bannerWidget(context),
          _liveTvTextWidget(context),
          _liveTvWidget(context),
          _livePodcastTextWidget(context),
          _livePodcastWidget(context)
        ],
      ),
    );
  }

  _bannerWidget(context) {
    bool isTablet() {
      return MediaQuery.of(context).size.shortestSide >= 600;
    }
    return StreamBuilder(
      stream: controller.getBannerData(),
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
          return SizedBox(
            height: DeviceInfo.isTv
                ? MediaQuery.of(context).size.height / 2
                : MediaQuery.of(context).size.height /
                    4, // Adjust the height as needed
            child: Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: snapshot.data!.docs.length,
                  options: CarouselOptions(
                    height: DeviceInfo.isTv
                        ? MediaQuery.of(context).size.height / 2
                        : MediaQuery.of(context).size.height / 3,
                    // Adjust the height as needed
                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                    enlargeFactor: 0.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    onPageChanged: (index, _) {
                      controller.selectedPageIndex.value = index;
                    },
                  ),
                  itemBuilder: (context, index, i) {
                    var data = snapshot.data!.docs[index];
                    String bannerImageUrl = data["banner_image"].toString();
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: CachedNetworkImage(
                        imageUrl: bannerImageUrl,
                        maxHeightDiskCache: 1024,
                        maxWidthDiskCache: 1024,
                        fit: BoxFit.cover,
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
                    );
                  },
                ),
                Positioned(
                  bottom: 10,
                  left: DeviceInfo.isTv ? 420 :isTablet()?265 : 170,
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        snapshot.data!.docs.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: EdgeInsets.only(
                              right: Dimensions.marginSizeHorizontal * .3),
                          height: index == controller.selectedPageIndex.value
                              ? Dimensions.heightSize * .55
                              : Dimensions.heightSize * .55,
                          width: index == controller.selectedPageIndex.value
                              ? Dimensions.widthSize * 1.75
                              : Dimensions.widthSize * .75,
                          decoration: BoxDecoration(
                            color: index == controller.selectedPageIndex.value
                                ? CustomColor.primaryLightColor
                                : CustomColor.primaryLightColor.withOpacity(.3),
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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

  _liveTvWidget(context) {
    return StreamBuilder(
      stream: controller.getLiveTvData(),
      builder: (context, snapshot) {
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
        return SizedBox(
          height: DeviceInfo.isTv
              ? MediaQuery.of(context).size.height * 0.25
              : MediaQuery.of(context).size.height *
                  0.12, //adjust live tv item height
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              var data = snapshot.data!.docs;
              String liveTvImageUrl = data[index]["banner"].toString();

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
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSize * .25),
                  width: MediaQuery.of(context).size.width * .35,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width,
                    child: CachedNetworkImage(
                      imageUrl: liveTvImageUrl,
                      maxHeightDiskCache: 512 * snapshot.data!.docs.length,
                      maxWidthDiskCache: 512 * snapshot.data!.docs.length,
                      fit: BoxFit.cover,
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
              );
            },
          ),
        );
      },
    );
  }

  _livePodcastTextWidget(context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.paddingSize,
          right: Dimensions.paddingSize,
          top: Dimensions.paddingSize,
          bottom: Dimensions.paddingSize * .3),
      child: Row(
        mainAxisAlignment: mainSpaceBet,
        children: [
          TitleHeading5Widget(
            text: Strings.livePodcast.tr,
            fontWeight: FontWeight.w600,
            fontSize: DeviceInfo.isTv
                ? Dimensions.headingTextSize5
                : Dimensions.headingTextSize2,
          ),
          InkWell(
            onTap: () {
              controller.goToLivePodcastScreen();
            },
            child: TitleHeading5Widget(
              text: Strings.viewMore.tr,
              fontSize: DeviceInfo.isTv
                  ? Dimensions.headingTextSize7
                  : Dimensions.headingTextSize6,
              color: CustomColor.primaryLightColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  _livePodcastWidget(context) {
    return StreamBuilder(
      stream: controller.getPodcastData(),
      builder: (context, snapshot) {
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
        return SizedBox(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount:
                snapshot.data!.docs.length > 5 ? 5 : snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              var data = snapshot.data!.docs;
              String podcastBannerImageUrl = data[index]["banner"].toString();
              String podcastTitle = data[index]["title"].toString();
              String podcastSubTitle = data[index]["subTitle"].toString();
              //String podcastUrl = data[index]["url"].toString();
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
                  child: Column(
                    children: [
                      Visibility(
                        visible: index % 2 == 0 && index != 0,
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: Dimensions.paddingSize * .5),
                          child: SizedBox(
                            height: Dimensions.heightSize * 7,
                            child: AdWidget(
                              ad: AdMobHelper.getBannerAd()..load(),
                              key: UniqueKey(),
                            ),
                          ),
                        ),
                      ),
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
                                maxHeightDiskCache: 512 *
                                    (snapshot.data!.docs.length > 5
                                        ? 5
                                        : snapshot.data!.docs.length),
                                maxWidthDiskCache: 512 *
                                    (snapshot.data!.docs.length > 5
                                        ? 5
                                        : snapshot.data!.docs.length),
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