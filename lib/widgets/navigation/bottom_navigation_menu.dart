
import '../../main.dart';
import '../../utils/basic_screen_imports.dart';


buildBottomNavigationMenu(context, bottomNavBarController) {
  return Obx(() {
    return Container(
      height:DeviceInfo.isTv ? MediaQuery.of(context).size.height * .11: MediaQuery.of(context).size.height * .07,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: BottomAppBar(
        padding: EdgeInsets.zero,
        elevation: 0,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: crossCenter,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            bottomItemWidget(
                Icons.home_filled, Strings.home.tr, bottomNavBarController, 0),
            bottomItemWidget(Icons.category_outlined, Strings.categories.tr,
                bottomNavBarController, 1),
            bottomItemWidget(
                Icons.settings, Strings.settings.tr, bottomNavBarController, 2),
          ],
        ),
      ),
    );
  });
}

bottomItemWidget(var icon, label, bottomNavBarController, page) {
  return Expanded(
    child: InkWell(
      onTap: () {
        bottomNavBarController.selectedIndex.value = page;
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.paddingSize * .05,
            horizontal: Dimensions.paddingSize * .06),
        child: Column(
          mainAxisAlignment: mainCenter,
          crossAxisAlignment: crossCenter,
          children: [
            //here designing the widget and passing icon receiving in bottom app bar
            Icon(
              icon,
              color: bottomNavBarController.selectedIndex.value == page
                  ? Get.isDarkMode
                  ? CustomColor.primaryLightColor
                  : CustomColor.primaryLightColor
                  : Get.isDarkMode
                  ? CustomColor.whiteColor
                  : CustomColor.blackColor.withOpacity(.30),
            ),
            verticalSpace(Dimensions.heightSize * 0.15),
            //here designing the widget and passing icon label receiving in bottom app bar
            CustomTitleHeadingWidget(
              text: label,
              style: Get.isDarkMode
                  ? CustomStyle.darkHeading5TextStyle.copyWith(
                color: bottomNavBarController.selectedIndex.value == page
                    ? CustomColor.primaryLightColor
                    : CustomColor.whiteColor,
                fontSize: Dimensions.headingTextSize8,
              )
                  : CustomStyle.lightHeading5TextStyle.copyWith(
                color: bottomNavBarController.selectedIndex.value == page
                    ? CustomColor.primaryLightColor
                    : CustomColor.blackColor.withOpacity(.30),
                fontSize: Dimensions.headingTextSize8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}