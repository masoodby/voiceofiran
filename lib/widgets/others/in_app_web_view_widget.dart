import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../../utils/basic_screen_imports.dart';

import '../../utils/custom_loading_api.dart';

// ignore: must_be_immutable
class WebViewScreen extends StatelessWidget {
  WebViewScreen({super.key, required this.title, required this.url});

  final String title, url;

  late InAppWebViewController webViewController;
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.primaryLightScaffoldBackgroundColor,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: TitleHeading4Widget(
          text: title,
        ),
        centerTitle: true,
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    String targetUrl = url;

    return Stack(
      children: [
        InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(targetUrl)),
          onWebViewCreated: (controller) {
            webViewController = controller;
            controller.addJavaScriptHandler(
              handlerName: 'jsHandler',
              callback: (args) {
                // Handle JavaScript messages from WebView
              },
            );
          },
          onLoadStart: (controller, url) {
            isLoading.value = true;
          },
          onLoadStop: (controller, url) {
            isLoading.value = false;
          },
          // ... other callbacks ...
        ),
        ValueListenableBuilder<bool>(
          valueListenable: isLoading,
          builder: (context, isLoading, _) {
            return isLoading
                ? const Center(child: CustomLoadingAPI())
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}