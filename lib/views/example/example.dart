import '../../../../views/example/mobile_screen_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/example_controller.dart';
import '../../utils/responsive_layout.dart';

class ExampleScreen extends StatelessWidget {
  ExampleScreen({Key? key}) : super(key: key);
  final controller = Get.put(ExampleController());

  @override
  Widget build(BuildContext context) {
    // mobile screen layout
    return ResponsiveLayout(
      mobileScaffold: MobileScreenLayout(
        controller: controller,
      ),

    );
  }
}