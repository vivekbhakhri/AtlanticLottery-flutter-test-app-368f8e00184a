import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  @override
  _WebviewScreenState createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  var loadingPercentage = 0;
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://www.alc.ca/content/alc-mobile/en.html',
      javascriptMode: JavascriptMode.disabled,
    );
  }
}
