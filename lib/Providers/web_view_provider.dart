import 'package:flutter/material.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewProvider extends ChangeNotifier {
  bool _isLoading = true;
  bool _isInitialLoad = true;
  late WebViewController _controller;

  bool get isLoading => _isLoading;
  bool get isInitialLoad => _isInitialLoad;
  WebViewController get controller => _controller;

  void setLoading(bool isLoading) {
    if (_isLoading != isLoading) {
      _isLoading = isLoading;
      notifyListeners();
    }
  }

  void onWebViewCreated(WebViewController webViewController) {
    _controller = webViewController;
    disableZoom();
    notifyListeners();
  }

  Future<void> loadUrl(String url) async {
    setLoading(true);
    try {
      await _controller.loadUrl(url);
    } finally {
      setLoading(false);
    }
  }

  JavascriptChannel toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      },
    );
  }

  NavigationDecision handleNavigation(NavigationRequest request) {
    final List<String> externalUrls = [
      'https://wa.me/',
      'https://chat.whatsapp.com/',
      'https://www.instagram.com/',
      'https://www.facebook.com/',
      'https://t.me/',
      'https://www.youtube.com/',
      'https://twitter.com/',
    ];

    if (request.url.startsWith('https://play.google.com/store/apps/')) {
      _launchURL(request.url);
      return NavigationDecision.prevent;
    }

    if (externalUrls.any(request.url.startsWith)) {
      _launchURL(request.url);
      return NavigationDecision.prevent;
    }

    return NavigationDecision.navigate;
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  void finishInitialLoad() {
    if (_isInitialLoad) {
      _isInitialLoad = false;
      notifyListeners();
    }
  }

  void disableZoom() {
    _controller.runJavascript(
        "document.querySelector('meta[name=viewport]')?.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no');"
            "var style = document.createElement('style');"
            "style.innerHTML = 'html, body { touch-action: manipulation; }';"
            "document.head.appendChild(style);"
    ).then((_) {
    }).catchError((error) {
    });
  }
}
