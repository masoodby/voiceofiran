import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../controller/language_controller/language_controller.dart';
import '../../../main.dart';
import '../../../routes/routes.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/theme.dart';
import '../../../widgets/others/custom_switch_widget.dart';
import '../../../widgets/others/custom_title_subtitle_widget.dart';

class SettingsScreenMobile extends StatelessWidget {
  SettingsScreenMobile({super.key});

  final controller = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: TitleHeading3Widget(
          text: Strings.settings.tr,
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
      children: [
        _languageWidget(context),
        _themeSwitchWidget(context),
        _versionWidget(context),
        _rateUsWidget(context),
        _aboutUsWidget(context),
        _privacyPolicyWidget(context),
      ],
    );
  }

  _languageWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        _showDialog(context);
      },
      child: CustomTitleSubtitleWidget(
        title: Strings.changeLanguage.tr,
        subTitle: controller.selectedLanguage.value.tr,
        //Strings.english.tr,
      ),
    );
  }

  _themeSwitchWidget(BuildContext context) {
    return Column(
      // crossAxisAlignment: crossStart,
      children: [
        Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            TitleHeading5Widget(
              padding: EdgeInsets.only(
                  bottom: Dimensions.paddingSize * .5,
                  top: Dimensions.paddingSize * .5),
              text: Strings.changeTheme.tr,
              fontSize: DeviceInfo.isTv
                  ? Dimensions.headingTextSize5
                  : Dimensions.headingTextSize3,
              fontWeight: DeviceInfo.isTv ? FontWeight.w500 : FontWeight.w600,
            ),
            CustomSwitchWidget(
              onTap: () {
                Themes().switchTheme();
              },
            ),
          ],
        ),
        Divider(
          thickness: Dimensions.heightSize * .1,
          color: Theme.of(context).dividerColor,
        )
      ],
    );
  }

  _versionWidget(BuildContext context) {
    return CustomTitleSubtitleWidget(
      title: Strings.version,
      subTitle: Strings.appVersion,
    );
  }

  _rateUsWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        _openDialog(context);
      },
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          TitleHeading5Widget(
            padding: EdgeInsets.only(
                bottom: Dimensions.paddingSize * .5,
                top: Dimensions.paddingSize * .5),
            text: Strings.rateUS.tr,
            fontSize: DeviceInfo.isTv
                ? Dimensions.headingTextSize5
                : Dimensions.headingTextSize3,
            fontWeight: DeviceInfo.isTv ? FontWeight.w500 : FontWeight.w600,
          ),
          Divider(
            thickness: Dimensions.heightSize * .1,
            color: Theme.of(context).dividerColor,
          )
        ],
      ),
    );
  }

  _aboutUsWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.aboutUs);
      },
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          TitleHeading5Widget(
            padding: EdgeInsets.only(
                bottom: Dimensions.paddingSize * .5,
                top: Dimensions.paddingSize * .5),
            text: Strings.aboutUs.tr,
            fontWeight: DeviceInfo.isTv ? FontWeight.w500 : FontWeight.w600,
            fontSize: DeviceInfo.isTv
                ? Dimensions.headingTextSize5
                : Dimensions.headingTextSize3,
          ),
          Divider(
            thickness: Dimensions.heightSize * .1,
            color: Theme.of(context).dividerColor,
          ),
        ],
      ),
    );
  }

  _openDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => SingleChildScrollView(
        child: AlertDialog(
          backgroundColor: Get.isDarkMode
              ? CustomColor.primaryBGDarkColor
              : CustomColor.whiteColor,
          alignment: Alignment.center,
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius * 2)),
          content: Builder(
            builder: (context) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * .70,
                height: DeviceInfo.isTv
                    ? MediaQuery.sizeOf(context).height * .5
                    : MediaQuery.sizeOf(context).height * .22,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: mainCenter,
                      crossAxisAlignment: crossCenter,
                      children: [
                        verticalSpace(Dimensions.heightSize),
                        TitleHeading5Widget(
                          text: Strings.rateUS.tr,
                          textAlign: TextAlign.center,
                          padding: EdgeInsets.only(
                            bottom: Dimensions.paddingSize * .1,
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.widthSize * 25,
                          child: TitleHeading5Widget(
                            text: Strings.tapStar.tr,
                            opacity: .30,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        verticalSpace(Dimensions.heightSize),
                        RatingBar.builder(
                          initialRating: 4,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSize * .25),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: TitleHeading4Widget(
                            text: Strings.submit.tr,
                            fontSize: DeviceInfo.isTv
                                ? Dimensions.headingTextSize5
                                : Dimensions.headingTextSize4,
                          ),
                        ),
                        verticalSpace(Dimensions.heightSize * 0.5),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  _privacyPolicyWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.privacyPolicy);
      },
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          TitleHeading5Widget(
            padding: EdgeInsets.only(
                bottom: Dimensions.paddingSize * .5,
                top: Dimensions.paddingSize * .5),
            text: Strings.privacyAndPolicy.tr,
            fontWeight: DeviceInfo.isTv ? FontWeight.w500 : FontWeight.w600,
            fontSize: DeviceInfo.isTv
                ? Dimensions.headingTextSize5
                : Dimensions.headingTextSize3,
          ),
          Divider(
            thickness: Dimensions.heightSize * .1,
            color: Theme.of(context).dividerColor,
          )
        ],
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.widthSize * 3,
                vertical: Dimensions.heightSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                controller.moreList.length,
                (index) => Container(
                  alignment: Alignment.centerLeft,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.widthSize * 1,
                      vertical: Dimensions.heightSize * 0.5),
                  child: TextButton(
                    onPressed: () {
                      controller.onChangeLanguage(
                          controller.moreList[index], index);
                      Get.back();
                    },
                    child: Text(
                      controller.moreList[index].tr,
                      style: TextStyle(
                        color: controller.selectedLanguage.value ==
                                controller.moreList[index]
                            ? CustomColor.primaryLightColor
                            : Get.isDarkMode
                                ? CustomColor.primaryBGLightColor
                                : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}