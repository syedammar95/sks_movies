import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:provider/provider.dart';
import 'Providers/connectivity_provider.dart';
import 'Providers/web_view_provider.dart';
import 'Providers/timer_provider.dart';
import 'Screens/web_view_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WebView.platform = SurfaceAndroidWebView();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WebViewProvider()),
        ChangeNotifierProvider(create: (_) => ConnectivityProvider()),
        ChangeNotifierProvider(create: (_) => TimerProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WebViewScreen(),
      ),
    );
  }
}
