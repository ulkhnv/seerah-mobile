import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class PrayerTimeState extends Equatable {
  const PrayerTimeState();

  @override
  List<Object> get props => [];
}

class PrayerTimeEmpty extends PrayerTimeState {
  @override
  List<Object> get props => [];
}

class PrayerTimeLoaded extends PrayerTimeState {
  final List<Widget> prayerTimeWidgets;
  final int index;
  final String time;

  const PrayerTimeLoaded(this.prayerTimeWidgets, this.index, this.time);
}

class PrayerTimeError extends PrayerTimeState {
  final String message;

  const PrayerTimeError({required this.message});

  @override
  List<Object> get props => [message];
}
