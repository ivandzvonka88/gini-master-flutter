import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NetworkStatus extends StatelessWidget {
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;
    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        bool isOnline = snapshot.data == ConnectivityResult.wifi ||
            snapshot.data == ConnectivityResult.mobile;
        return isOnline
            ? SvgPicture.asset(
                "assets/ui/online-dot.svg",
                width:
                    isPortrait ? size.width * 0.026666 : size.height * 0.026666,
                height:
                    isPortrait ? size.width * 0.026666 : size.height * 0.026666,
              )
            : SizedBox.shrink();
      },
    );
  }
}
