import 'package:flutter/material.dart';
import 'package:seerah/src/core/utils/S.dart';
import 'package:seerah/src/features/my_iman/presentation/widgets/timer_widget.dart';

class TimerLocationWidget extends StatelessWidget {
  final int index;
  final String time;

  const TimerLocationWidget({super.key, required this.index, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
      child: Row(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
           _getName(context),
            const SizedBox(
              height: 2,
            ),
            TimerWidget(time: time,),
          ]),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
             Text("Казахстан", style: TextStyle(
               fontSize: 18, color: Colors.grey.shade700)
             ),
              const SizedBox(
                height: 2,
              ),
              const Text("Алматы",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21))
            ],
          )
        ],
      ),
    );
  }

  Text _getName(BuildContext context) {

    final String name;
    switch (index) {
      case 0:
        name = S.of(context).fajr;
      case 1:
        name = S.of(context).sunrise;
      case 2:
        name = S.of(context).zuhr;
      case 3:
        name = S.of(context).asr;
      case 4:
        name = S.of(context).magrib;
      case 5:
        name = S.of(context).isha;
      default:
        name = "";
    }
    return Text(
      name,
      style: TextStyle(
          fontSize: 18, color: Colors.grey.shade700),
    );
  }
}
