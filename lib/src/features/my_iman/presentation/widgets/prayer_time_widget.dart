import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seerah/src/features/my_iman/presentation/bloc/prayer_time_cubit/prayer_time_cubit.dart';
import 'package:seerah/src/features/my_iman/presentation/bloc/prayer_time_cubit/prayer_time_state.dart';
import 'package:seerah/src/features/my_iman/presentation/widgets/timer_location_widget.dart';
import 'package:seerah/src/features/settings/presentation/widget/border_container_widget.dart';

class PrayerTimeWidget extends StatelessWidget {
  PrayerTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
      builder: (context, state) {
        if (state is PrayerTimeLoaded) {
          return BorderContainer(
            child: Column(
              children: [
                TimerLocationWidget(
                  index: state.index + 1,
                  time: state.time,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Divider(
                    color: Colors.grey.shade300,
                    thickness: 1.0,
                  ),
                ),
                Column(children: state.prayerTimeWidgets)
              ],
            ),
          );
        } else {
          return const Text("Hi");
        }
      },
    );
  }
}
