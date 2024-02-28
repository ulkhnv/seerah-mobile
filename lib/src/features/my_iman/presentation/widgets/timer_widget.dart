import 'dart:async';

import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  final String time;

  const TimerWidget({super.key, required this.time});


  @override
  _TimerWidgetState createState() => _TimerWidgetState(time: time);
}

class _TimerWidgetState extends State<TimerWidget> {
  final String time;
  late Timer _timer;
  late int _secondsRemaining;

  _TimerWidgetState({required this.time}); // 1 час в секундах

  @override
  void initState() {
    super.initState();
    final parsedTime = TimeOfDay(
      hour: int.parse(time.split(":")[0]),
      minute: int.parse(time.split(":")[1]),
    );
    var currentTime = DateTime.now();
    var targetDateTime = DateTime(
      currentTime.year,
      currentTime.month,
      currentTime.day,
      parsedTime.hour,
      parsedTime.minute,
    );

    _secondsRemaining = targetDateTime.difference(currentTime).inSeconds;

    _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
  }

  void _updateTimer(Timer timer) {
    if (_secondsRemaining > 0) {
      setState(() {
        _secondsRemaining--;
      });
    } else {
      _timer.cancel();
    }
  }

  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds ~/ 60) % 60;
    int remainingSeconds = seconds % 60;

    return '${_twoDigits(hours)}:${_twoDigits(minutes)}:${_twoDigits(remainingSeconds)}';
  }

  String _twoDigits(int n) {
    if (n >= 10) {
      return '$n';
    } else {
      return '0$n';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatTime(_secondsRemaining),
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
