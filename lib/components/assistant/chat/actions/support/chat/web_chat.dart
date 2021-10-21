import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AssistantSupportChatWebView extends StatefulWidget {
  AssistantSupportChatWebView(
      {this.link = "https://demo.flex.twilio.com/chat?"
          "accountSid=AC6efd9206402f9d1d4aebbe6d7f0ce948&"
          "flexFlowSid=FO4df3dc4ad51cbc99fa0790aa1e8f4fc3"});
  final String link;

  @override
  _AssistantSupportChatWebViewState createState() =>
      _AssistantSupportChatWebViewState();
}

class _AssistantSupportChatWebViewState
    extends State<AssistantSupportChatWebView> {
  var isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.link,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (value) {
              if (isLoading) {
                setState(() {
                  isLoading = false;
                });
              }
            },
          ),
          isLoading
              ? Container(
                  color: Colors.white,
                  child: Center(child: CircularProgressIndicator()),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
