import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seerah/src/core/error/failures.dart';
import 'package:seerah/src/features/my_iman/presentation/bloc/prayer_time_cubit/prayer_time_state.dart';
import 'package:seerah/src/features/my_iman/presentation/widgets/one_prayer_time_widget.dart';

const serverFailureMessage = 'Server Failure';
const cachedFailureMassage = 'Cache Failure';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeCubit() : super(PrayerTimeEmpty());

  Future<void> loadPrayerTime() async {
    List<String> prayerTimes = [
      "06:36",
      "07:53",
      "13:10",
      "16:38",
      "18:22",
      "19:38",
      "06:40"
    ];

    final current = _getCurrentPrayerTime(prayerTimes);

    emit(PrayerTimeLoaded(_getPrayerTimeWidgets(prayerTimes), current, prayerTimes[current + 1]));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        return serverFailureMessage;
      case CacheFailure _:
        return cachedFailureMassage;
      default:
        return 'Unexpected Error';
    }
  }

  List<Widget> _getPrayerTimeWidgets(List<String> prayerTimes) {
    List<Widget> prayerTimeWidgets = [];
    var current = _getCurrentPrayerTime(prayerTimes);
    for (var i = 0; i < 6; i++) {
      if (i == current) {
        Widget prayerTime = OnePrayerTimeWidget(
          index: i,
          time: prayerTimes[i],
          current: true,
        );
        prayerTimeWidgets.add(prayerTime);
      } else if (i > current) {
        Widget prayerTime = OnePrayerTimeWidget(
          index: i,
          time: prayerTimes[i],
        );
        prayerTimeWidgets.add(prayerTime);
      } else {
        Widget prayerTime = OnePrayerTimeWidget(
          index: i,
          time: prayerTimes[i],
          active: false,
        );
        prayerTimeWidgets.add(prayerTime);
      }
    }
    return prayerTimeWidgets;
  }

  int _getCurrentPrayerTime(List<String> prayerTimes) {
    final currentTime = TimeOfDay.now();
    for (var i = 5; i >= 0; i--) {
      final parsedTime = TimeOfDay(
        hour: int.parse(prayerTimes[i].split(":")[0]),
        minute: int.parse(prayerTimes[i].split(":")[1]),
      );
      if (currentTime.hour > parsedTime.hour ||
          (currentTime.hour == parsedTime.hour &&
              currentTime.minute >= parsedTime.minute)) {
        return i;
      }
    }
    return 0;
  }
}
