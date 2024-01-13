import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../controller/navigation/category/category_controller.dart';
import '../../../../controller/navigation/home/home_screen_controller.dart';
import '../../../../helper/admob_helper.dart';
import '../../../../main.dart';
import '../../../../utils/basic_screen_imports.dart';

class CategoryScreenMobile extends StatelessWidget {
  CategoryScreenMobile({super.key});

  final controller = Get.put(CategoryController());
  final homeController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleHeading3Widget(text: Strings.categories.tr),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(context) {
    return RefreshIndicator(
      onRefresh: () async {
        homeController.catData();
        homeController.getCategoryData();
      },
      child: ListView(children: [
        _categoryGridWidget(context),
        SizedBox(
          height: 50,
          child: AdWidget(
            ad: AdMobHelper.getBannerAd()..load(),
            key: UniqueKey(),
          ),
        ),
      ]),
    );
  }

  _categoryGridWidget(context) {
    return StreamBuilder(
      stream: homeController.catData(),
      builder: (context, snapshot) {
        // my test
        print("test $snapshot");
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
        return const Text("ok");
        //  return SizedBox(
        //   height: MediaQuery.of(context).size.height,
        //   child: GridView.builder(
        //     physics: const BouncingScrollPhysics(),
        //     scrollDirection: Axis.vertical,
        //     shrinkWrap: true,
        //     // itemCount: snapshot.data!.docs.length,
        //     itemBuilder: (BuildContext context, int index) {
        //       var categoryData = snapshot.data!.docs[index];
        //       String categoryImageUrl = categoryData["banner"].toString();
        //       String categoryName = categoryData["name"].toString();
        //       return Visibility(
        //         visible: categoryData["visibility"],
        //         child: InkWell(
        //           onTap: () {
        //             AdMobHelper.getInterstitialAdLoad();
        //             homeController.goToCategoryPreviewScreen(categoryData);
        //           },
        //           child: Stack(
        //             children: [
        //               Padding(
        //                 padding: EdgeInsets.symmetric(
        //                     horizontal: Dimensions.paddingSize * .5),
        //                 child: CachedNetworkImage(
        //                   imageUrl: categoryImageUrl,
        //                   // maxHeightDiskCache: 200 * snapshot.data!.docs.length,
        //                   // maxWidthDiskCache: 200 * snapshot.data!.docs.length,
        //                   height: MediaQuery.of(context).size.height * .35,
        //                   width: MediaQuery.of(context).size.width * .55,
        //                   fit: BoxFit.cover,
        //                   placeholder: (context, url) => Shimmer.fromColors(
        //                     baseColor: Colors.grey[300]!,
        //                     // Choose your shimmer base color
        //                     highlightColor: Colors.grey[100]!,
        //                     // Choose your shimmer highlight color
        //                     child: Container(
        //                       width: double.infinity,
        //                       height: double.infinity,
        //                       color: Colors
        //                           .white, // You can change this color as needed
        //                     ),
        //                   ),
        //                   errorWidget: (context, url, error) =>
        //                       const Icon(Icons.error),
        //                 ),
        //               ),
        //               Container(
        //                 alignment: Alignment.bottomCenter,
        //                 // decoration: BoxDecoration(color: CustomColor.primaryLightColor.withOpacity(.3)),
        //                 child: TitleHeading2Widget(
        //                   text: categoryName,
        //                   color: CustomColor.whiteColor,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       );
        //     },
        //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        //         maxCrossAxisExtent: DeviceInfo.isTv ? 400.r : 300.r,
        //         childAspectRatio: DeviceInfo.isTv ? 4 / 2 : 3 / 2,
        //         crossAxisSpacing: DeviceInfo.isTv ? 10 : 20,
        //         mainAxisSpacing: DeviceInfo.isTv ? 10 : 20),
        //   ),
        // );
      },
    );
  }
}
