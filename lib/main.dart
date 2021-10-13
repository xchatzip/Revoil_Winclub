import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('REVOIL'),
        ),
        body: _buildWebview(),
      ),
    );
  }

  NavigationDecision _interceptNavigation(NavigationRequest request) {
    _launchURL(request.url);

    return NavigationDecision.navigate;
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _buildWebview() {
    return WebView(
      initialUrl: "https://pos.revoil.gr:9090/",
      javascriptMode: JavascriptMode.unrestricted,
      navigationDelegate: _interceptNavigation,
    );
  }
}
