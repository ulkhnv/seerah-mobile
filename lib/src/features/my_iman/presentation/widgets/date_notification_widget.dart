import 'package:flutter/material.dart';
import 'package:seerah/src/core/utils/S.dart';
import 'package:seerah/src/features/settings/presentation/widget/border_container_widget.dart';

class DateNotificationWidget extends StatelessWidget {
  const DateNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BorderContainer(
          padding: 9,
          child: Row(
            children: [
              Image.asset(
                "assets/images/my_iman/calendar.png",
                width: 25,
                height: 25,
              ),
              const SizedBox(width: 10),
              Text(
                _getWeekday(context),
                style: const TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

String _getWeekday(BuildContext context) {
  DateTime dateTime = DateTime.now();
  switch (dateTime.weekday) {
    case 1:
      return S.of(context).monday;
    case 2:
      return S.of(context).tuesday;
    case 3:
      return S.of(context).wednesday;
    case 4:
      return S.of(context).thursday;
    case 5:
      return S.of(context).friday;
    case 6:
      return S.of(context).saturday;
    case 7:
      return S.of(context).sunday;
    default:
      return "Unknown";
  }
}
