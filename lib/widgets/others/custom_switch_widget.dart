import '../../utils/basic_widget_imports.dart';

class CustomSwitchWidget extends StatefulWidget {
  const CustomSwitchWidget({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  State<CustomSwitchWidget> createState() => _CustomSwitchWidgetState();
}

class _CustomSwitchWidgetState extends State<CustomSwitchWidget> {
  bool _switchValue = Get.isDarkMode;

  @override
  initState() {
    super.initState();
    setState(() {
      _switchValue = Get.isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      activeColor: CustomColor.blackColor,
      inactiveThumbColor: CustomColor.secondaryLightTextColor,
      inactiveTrackColor: CustomColor.currencyColor.withOpacity(0.5),
      activeTrackColor: CustomColor.currencyColor.withOpacity(0.5),
      thumbIcon: MaterialStateProperty.resolveWith((Set states) {
        if (_switchValue == true) {
          return const Icon(Icons.nightlight_round);
        }
        return const Icon(
            Icons.sunny); // All other states will use the default thumbIcon.
      }),
      // Moon icon for inactive state
      value: _switchValue,
      onChanged: (value) {
        _switchValue = value;
        widget.onTap();
      },
    );
  }
}