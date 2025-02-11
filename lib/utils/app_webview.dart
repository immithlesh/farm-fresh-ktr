import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../theme/app_color.dart';
import 'app_progress.dart';
import 'common_toolbar.dart';
import 'custom_snackbar.dart';
import 'extension.dart';
import 'loader_controller.dart';

class WebViewWidgetApp extends StatefulWidget {
  final String initialUrl;
  final String title;

  WebViewWidgetApp({required this.initialUrl, required this.title});

  @override
  _WebViewWidgetState createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidgetApp> {
  late WebViewController _webViewController;
  late String url;
  late String title;
  final LoaderController loaderController = Get.find();

  @override
  void initState() {
    url = widget.initialUrl;
    title = widget.title;
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..clearCache()
      ..setBackgroundColor(appBackgroundColor)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            loaderController.showLoading();
          },
          onPageStarted: (String url) {
            print("startedUrl"+url.toString());

          },
          onPageFinished: (String url) {
            print("finishedUrl"+url.toString());

            loaderController.hideLoading();
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.back();
        return Future(() => false);
      },
      child: Scaffold(
          appBar: CommonToolbar(
            title: title.toUpperCase(),
            onBack: () {
              Get.back();
            },
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(child: WebViewWidget(controller: _webViewController))
                ],
              ),
              GetBuilder<LoaderController>(builder: (ctrl) {
                return ctrl.isLoading ? const AppProgress() : Container();
              }),
            ],
          )),
    );
  }
}
