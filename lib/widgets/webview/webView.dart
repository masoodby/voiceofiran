import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewtate();
}

class _WebViewtate extends State<WebView> {
  Future<void> _onShowUserAgent() {
    return WebViewController().runJavaScript(
        '<p><iframe title="YouTube video player" src="//www.youtube.com/embed/mnEmwq_rsLw" width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe></p>');
    // ..loadRequest(Uri.parse('https://www.youtube.com/embed/mnEmwq_rsLw/'));
    // return webViewController.runJavaScript(
    //   'Toaster.postMessage("User Agent: " + navigator.userAgent);',
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter WebView"),
        ),
        body: WebViewWidget(controller: _onShowUserAgent()));
  }
}
