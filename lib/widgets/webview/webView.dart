import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewtate();
}

class _WebViewtate extends State<WebView> {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://www.youtube.com/embed/mnEmwq_rsLw'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter WebView"),
        ),
        body: WebViewWidget(controller: controller));
  }
}

// ignore_for_file: avoid_web_libraries_in_flutter

// import 'package:universal_html/parsing.dart';

// import 'dart:ui' as ui;

// import 'package:flutter/material.dart';

// class WebView extends StatelessWidget {
//   const WebView({super.key});

//   @override
//   Widget build(BuildContext context) {
//       final htmlDocument = parseHtmlDocument('<html>...</html>');

//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: ,
//           )
//         ],
//       ),
//     );
//   }
// }
