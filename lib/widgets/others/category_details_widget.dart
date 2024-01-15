import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import '../../main.dart';
import '../../utils/basic_screen_imports.dart';

class CategoryDetailsWidget extends StatelessWidget {
  final String imagePath, title, subTitle;

  const CategoryDetailsWidget(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subTitle, required itemCount,

      });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              margin:
                  EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * .3),
              height:DeviceInfo.isTv ? MediaQuery.of(context).size.height * 0.23: MediaQuery.of(context).size.height * 0.08,
             child: CachedNetworkImage(
               imageUrl: imagePath,
               maxWidthDiskCache: 320,
                maxHeightDiskCache: 320,
               height: MediaQuery.of(context).size.height * .35,
               width: MediaQuery.of(context).size.width * .55,
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
          horizontalSpace(Dimensions.widthSize * .5),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: crossStart,
              children: [
                TitleHeading5Widget(
                  text: title,
                  //fontSize: Dimensions.headingTextSize6,
                  fontWeight: FontWeight.w600,
                  color: Get.isDarkMode
                      ? CustomColor.whiteColor.withOpacity(0.65)
                      : CustomColor.blackColor.withOpacity(0.65),
                ),
                verticalSpace(DeviceInfo.isTv ?Dimensions.heightSize * 1.5:Dimensions.heightSize * 0.5),
                TitleHeading5Widget(
                  text: subTitle,
                  fontSize: DeviceInfo.isTv ?Dimensions.headingTextSize6:Dimensions.headingTextSize4,
                  color: Get.isDarkMode
                      ? CustomColor.whiteColor.withOpacity(0.3)
                      : CustomColor.blackColor.withOpacity(0.3),
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}