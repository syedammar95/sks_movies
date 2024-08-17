import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/timer_provider.dart';

class SplashScreen extends StatelessWidget {
  final String backgroundImagePath;

  const SplashScreen({super.key, required this.backgroundImagePath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(backgroundImagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Timer container
        Positioned(
          top: 8.0,
          right: 16.0,
          child: Consumer<TimerProvider>(
            builder: (context, timerProvider, _) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Jump over ${timerProvider.remainingTime} s',
                  style: const TextStyle(color: Colors.black),
                ),
              );
            },
          ),
          // child: CustomLoader(),
        ),
        // Loader
      ],
    );
  }
}
