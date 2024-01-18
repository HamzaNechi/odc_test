import 'package:flutter/material.dart'; 
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  final String nomPlace;
  const WebViewScreen({super.key,required this.url, required this.nomPlace});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  
  late WebViewController controller;
  @override
  void initState() {
    super.initState();
    var uri = Uri.parse(widget.url);

    controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nomPlace),
      ),
      body: Center(
        child: WebViewWidget(
          controller: controller,
          ),
      ),
    );
  }
}