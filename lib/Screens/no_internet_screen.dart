import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/web_view_provider.dart';
import '../Utils/custom_loader.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WebViewProvider>(
      builder: (context, webViewProvider, child) {
        return const Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No Internet Connection',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 25),
                CustomLoader()
              ],
            ),
          ),
        );
      },
    );
  }
}
