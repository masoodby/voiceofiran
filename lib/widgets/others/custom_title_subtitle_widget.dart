// ignore_for_file: prefer_const_constructors_in_immutables

import '../../main.dart';
import '../../utils/basic_screen_imports.dart';

class CustomTitleSubtitleWidget extends StatelessWidget {
  CustomTitleSubtitleWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.showDivider = true,
  });

  final String? title;
  final String? subTitle;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TitleHeading5Widget(
            padding: EdgeInsets.only(
                bottom: Dimensions.paddingSize * .25,
                top: Dimensions.paddingSize * .25),
            text: title!.tr,
            fontSize:DeviceInfo.isTv? Dimensions.headingTextSize5:Dimensions.headingTextSize3,
          fontWeight:DeviceInfo.isTv? FontWeight.w500: FontWeight.w600,
        ),
        TitleHeading5Widget(
          padding: EdgeInsets.only(bottom: Dimensions.paddingSize * .25),
          text: subTitle!.tr,

          opacity: .3,
            fontSize:DeviceInfo.isTv? Dimensions.headingTextSize6:Dimensions.headingTextSize4,
        ),
        showDivider == true
            ? Divider(
          thickness: Dimensions.heightSize * .1,
          color: Get.isDarkMode?CustomColor.whiteColor.withOpacity(.5): CustomColor.blackColor.withOpacity(.1),
        )
            : const SizedBox()
      ],
    );
  }
}