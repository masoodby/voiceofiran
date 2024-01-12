// ignore_for_file: deprecated_member_use

import '../../../../controller/example_controller.dart';
import '../../../../widgets/inputs/password_input_widget.dart';

import '../../utils/basic_screen_imports.dart';
import '../../widgets/drawer/drawer_widget.dart';

class MobileScreenLayout extends StatelessWidget {
  MobileScreenLayout({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ExampleController controller;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .scaffoldBackgroundColor,
      appBar: appBarWidget(context),
      drawer: const DrawerWidget(),
      body: _bodyWidget(context),
    );
  }

  // appbar
  appBarWidget(BuildContext context) {
    return PrimaryAppBar(
      appbarSize: Dimensions.appBarHeight,
      toolbarHeight: Dimensions.appBarHeight,
      title: Row(
        mainAxisAlignment: mainStart,
        children: const [
          TitleHeading1Widget(
            text: Strings.appName,
          ),
        ],
      ),
      leading: Builder(builder: (context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(
            Icons.menu,
            size: Dimensions.iconSizeLarge,
          ),
        );
      }),
      // action: [
      //   IconButton(
      //     onPressed: () {
      //
      //     },
      //     icon: CustomImageWidget(
      //       path: Assets.icon.notification,
      //       height: Dimensions.heightSize * 2,
      //       width: Dimensions.widthSize,
      //     ),
      //   )
      // ],
      appBar: AppBar(),
      backgroundColor: Colors.transparent,
      autoLeading: false,
      elevation: 0,
      appbarColor: Colors.transparent,
    );
  }

  // body widget
  _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.paddingSize, right: Dimensions.paddingSize),
        child: Column(
          children: [
            _headingAndTitleWidget(context),
            _inputWidget(context),
            _buttonWidget(context),
          ],
        ),
      ),
    );
  }

  // heading and titles
  _headingAndTitleWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [

        // Using more customization option

        TitleHeading1Widget(
          text: 'Heading',
          padding: EdgeInsets.only(bottom: Dimensions.paddingSize * 0.2),
          fontSize: Dimensions.headingTextSize1 * 2,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
        const TitleHeading4Widget(
            text:
            'Body size is here. It is a long established fact that a reader '
                'will be distracted by the readable content of a page when '
                'looking at its layout.'),
      ],
    );
  }

  // input widgets
  _inputWidget(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSizeVertical * 4.4),
      height: height * 0.30,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _customInputWidget(
                    context,
                    title: Strings.userName.tr,
                    hint: Strings.userName.tr,
                    controller: controller.usernameController,
                  ),
                ),
                horizontalSpace(Dimensions.marginSizeBetweenColumn),
                Expanded(
                  child: _customInputWidget(
                    context,
                    title: Strings.userName.tr,
                    hint: Strings.userName.tr,
                    controller: controller.usernameController,
                  ),
                ),
              ],
            ),
            verticalSpace(Dimensions.marginBetweenInputBox * 0.5),
            _customPasswordInputWidget(
              context,
              title: Strings.password.tr,
              hint: Strings.password.tr,
              controller: controller.passwordController,
            ),
          ],
        ),
      ),
    );

// body widget
  }

// custom input widget
  _customInputWidget(BuildContext context,
      {required String title,
        required String hint,
        required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHeading4Widget(
          text: title,
        ),
        SizedBox(
          height: Dimensions.marginBetweenInputTitleAndBox,
        ),
        PrimaryTextInputWidget(
          controller: controller,
          hintText: '${Strings.enter} $hint',
          borderColor: Theme
              .of(context)
              .primaryColor,
          color: Theme
              .of(context)
              .backgroundColor,
        ),
      ],
    );
  }

  // custom password  input widget
  _customPasswordInputWidget(BuildContext context,
      {required String title,
        required String hint,
        required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHeading4Widget(
          text: title,
        ),
        SizedBox(
          height: Dimensions.marginBetweenInputTitleAndBox,
        ),
        PasswordInputWidget(
          controller: controller,
          hintText: '${Strings.enter} $hint',
          borderColor: Theme
              .of(context)
              .primaryColor,
          color: Theme
              .of(context)
              .backgroundColor,
          suffixColor: Theme
              .of(context)
              .primaryColor,
        ),
      ],
    );
  }

  // button widget
  _buttonWidget(BuildContext context) {
    return PrimaryButton(
      title: Strings.signIn.tr,
      onPressed: () {
        if (formKey.currentState!.validate()) {}
      },
      borderColor: Theme
          .of(context)
          .primaryColor,
      buttonColor: Theme
          .of(context)
          .primaryColor,
    );
  }
}