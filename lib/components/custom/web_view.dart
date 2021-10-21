import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LegalWebView extends StatefulWidget {
  LegalWebView({@required this.link});
  final String link;

  @override
  _LegalWebViewState createState() => _LegalWebViewState();
}

class _LegalWebViewState extends State<LegalWebView> {
  var isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        ),
        WebView(
          initialUrl: widget.link,
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (value) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      ],
    );
  }
}
