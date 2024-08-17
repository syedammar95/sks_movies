import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:provider/provider.dart';
import '../Providers/web_view_provider.dart';
import '../Providers/connectivity_provider.dart';
import '../Screens/no_internet_screen.dart';
import '../Screens/splash_screen.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<WebViewProvider, ConnectivityProvider>(
      builder: (context, webViewProvider, connectivityProvider, child) {
        if (!connectivityProvider.isConnected) {
          return const NoInternetScreen();
        }
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: WillPopScope(
              onWillPop: () => _onWillPop(context, webViewProvider),
              child: Stack(
                children: [
                  WebView(
                    initialUrl: 'https://www.sksmoviess.com',
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (controller) {
                      webViewProvider.onWebViewCreated(controller);
                    },
                    onPageStarted: (_) => webViewProvider.setLoading(true),
                    onPageFinished: (url) {
                      if (webViewProvider.isInitialLoad) {
                        webViewProvider.finishInitialLoad();
                      }
                      webViewProvider.setLoading(false);
                      webViewProvider.disableZoom();
                    },
                    navigationDelegate: webViewProvider.handleNavigation,
                    javascriptChannels: <JavascriptChannel>{
                      webViewProvider.toasterJavascriptChannel(context),
                    },
                    gestureNavigationEnabled: true,
                    geolocationEnabled: false,
                    zoomEnabled: false,
                  ),
                  if (webViewProvider.isInitialLoad)
                    const SplashScreen(backgroundImagePath: 'assets/images/sks_bg.png'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool> _onWillPop(BuildContext context, WebViewProvider webViewProvider) async {
    final canGoBack = await webViewProvider.controller.canGoBack();
    if (canGoBack) {
      webViewProvider.controller.goBack();
      return false;
    }
    return true;
  }
}
