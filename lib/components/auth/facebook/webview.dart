import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class CustomWebView extends StatefulWidget {
  final String selectedUrl;

  CustomWebView({this.selectedUrl});

  @override
  _CustomWebViewState createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  final flutterWebviewPlugin = FlutterWebviewPlugin();
  var isProcessing = true;

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (mounted) {
          setState(() {
            isProcessing = false;
          });
        }
      });
      if (url.contains("#access_token")) {
        succeed(url);
      }

      if (url.contains(
          "https://www.facebook.com/connect/login_success.html?error=access_denied&error_code=200&error_description=Permissions+error&error_reason=user_denied")) {
        denied();
      }
    });
  }

  denied() {
    Navigator.pop(context);
  }

  succeed(String url) {
    var params = url.split("access_token=");

    var endparam = params[1].split("&");

    Navigator.pop(context, endparam[0]);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var isDark = theme.brightness == Brightness.dark;
    // TODO: Use Webview instead
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: isDark ? theme.primaryColor : Colors.white,
    //     title: Text("Facebook login"),
    //   ),
    //   body: WebView(
    //     initialUrl: widget.selectedUrl,
    //     javascriptMode: JavascriptMode.unrestricted,
    //     onWebViewCreated: (controller){
    //       controller.clearCache();
    //     },
    //     onPageStarted: (url) {
    //       if (mounted) {
    //         setState(() {
    //           isProcessing = false;
    //         });
    //       }
    //       if (url.contains("#access_token")) {
    //         succeed(url);
    //       }
    //
    //       if (url.contains(
    //           "https://www.facebook.com/connect/login_success.html?error=access_denied&error_code=200&error_description=Permissions+error&error_reason=user_denied")) {
    //         denied();
    //       }
    //     },
    //   ),
    // );
    return Stack(
      children: [
        WebviewScaffold(
          url: widget.selectedUrl,
          clearCache: true,
          clearCookies: true,
          appBar: AppBar(
            backgroundColor: isDark ? theme.primaryColor : Colors.white,
            title: Text("Facebook login"),
          ),
        ),
        isProcessing ? LinearProgressIndicator() : Container(),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
