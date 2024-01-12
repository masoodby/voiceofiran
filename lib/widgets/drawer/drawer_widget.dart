import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_widget_imports.dart';
import '../others/custom_image_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            color: Get.isDarkMode
                ? CustomColor.blackColor
                : CustomColor.whiteColor),
        child: _allItemListView(context),
      ),
    );
  }

  buildMenuItem(
    BuildContext context, {
    required String title,
    required String imagePath,
    required VoidCallback onTap,
    double scaleImage = 1,
  }) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize,
          ),
          child: ListTile(
            dense: true,
            leading: CustomImageWidget(
              path: imagePath,
              height: Dimensions.heightSize * 2.7,
              width: Dimensions.widthSize * 3,
            ),
            title: TitleHeading3Widget(
              text: title,
            ),
            onTap: onTap,
          ),
        ),
      ],
    );
  }

  _drawerItems(BuildContext context) {
    return Column(
      children: [
        buildMenuItem(
          context,
          imagePath: Assets.clipart.confirmation,
          title: 'Strings.myInvoice.tr',
          onTap: () {},
        ),
      ],
    );
  }

  _allItemListView(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: Dimensions.paddingSize,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Dimensions.heightSize * 3,
              ),
              // CustomImageWidget(
              //   path: Assets.logo.basicLogo.path,
              //   height: Dimensions.heightSize * 3,
              //   width: Dimensions.widthSize * 5,
              // ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              _userImage(context),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              const TitleHeading2Widget(text: 'Admeral Vison'),
              SizedBox(
                height: Dimensions.heightSize * 0.2,
              ),
              const TitleHeading4Widget(
                text: 'admeralvison@gmail.com',
                opacity: 0.5,
              ),
              const Text('hello'),
              SizedBox(
                height: Dimensions.heightSize,
              ),
            ],
          ),
        ),
        _drawerItems(context),
      ],
    );
  }

  _userImage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Theme.of(context).primaryColor, width: 4)),
      child: Center(
        child: CircleAvatar(
          radius: Dimensions.radius * 6,
          backgroundColor: Colors.transparent,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Dimensions.radius * 7.2,
            child: ClipOval(
              child: FadeInImage(
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                image: const NetworkImage(''),
                placeholder: AssetImage(Assets.clipart.sampleProfile.path),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Image.asset(Assets.clipart.sampleProfile.path,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}