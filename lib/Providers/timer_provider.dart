import 'dart:async';
import 'package:flutter/foundation.dart';

class TimerProvider with ChangeNotifier {
  late Timer _timer;
  late DateTime _startTime;
  final int _initialDuration = 5;
  int _remainingTime = 5;

  TimerProvider() {
    _startTime = DateTime.now();
    _startTimer();
  }

  int get remainingTime => _remainingTime;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final elapsedTime = DateTime.now().difference(_startTime).inSeconds;
      _remainingTime = _initialDuration - elapsedTime;
      if (_remainingTime <= 0) {
        _timer.cancel();
        _remainingTime = 0;
      }
      notifyListeners();
    });
  }

  void resetTimer() {
    _timer.cancel();
    _remainingTime = _initialDuration;
    _startTime = DateTime.now();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
