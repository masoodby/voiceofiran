import 'package:country_code_picker/country_code_picker.dart';

import '../../utils/basic_widget_imports.dart';

class ProfileCountryCodePickerWidget extends StatelessWidget {
  const ProfileCountryCodePickerWidget({
    Key? key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.onChanged,
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final ValueChanged? onChanged;

  // static String? countryName =;

  @override
  Widget build(BuildContext context) {
    // final authController = Get.put(SignUpController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: Dimensions.inputBoxHeight * 0.80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
              border: Border.all(color: Theme.of(context).primaryColor)),
          width: double.infinity,
          child: CountryCodePicker(
            textStyle: Get.isDarkMode
                ? CustomStyle.darkHeading4TextStyle
                : CustomStyle.lightHeading4TextStyle,
            onChanged: (value) {
              // controller.text = value.name!;
              // authController.countryCode.value = value.dialCode.toString();
              // authController.countryShortCode.value = value.code.toString();
            },
            // onChanged: onChanged,
            showOnlyCountryWhenClosed: true,
            showDropDownButton: true,
            initialSelection: controller.text,
            backgroundColor: Colors.transparent,
            showCountryOnly: true,
            alignLeft: true,
            searchStyle: Get.isDarkMode
                ? CustomStyle.darkHeading4TextStyle
                : CustomStyle.lightHeading4TextStyle,
            dialogTextStyle: Get.isDarkMode
                ? CustomStyle.darkHeading4TextStyle
                : CustomStyle.lightHeading4TextStyle,
            // onInit: (code) => {profileController.countryController.text = code?.name},
          ),
        ),
        SizedBox(
          height: Dimensions.heightSize,
        ),
      ],
    );
  }
}
