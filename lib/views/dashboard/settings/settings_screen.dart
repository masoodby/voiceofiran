import '../../../../views/dashboard/settings/settings_screen_mobile.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(mobileScaffold: SettingsScreenMobile());
  }
}