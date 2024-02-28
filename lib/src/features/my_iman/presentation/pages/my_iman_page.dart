import 'package:flutter/material.dart';
import 'package:seerah/src/features/my_iman/presentation/widgets/date_notification_widget.dart';
import 'package:seerah/src/features/my_iman/presentation/widgets/prayer_time_widget.dart';
import 'package:seerah/src/features/my_iman/presentation/widgets/qibla_tasbih_widget.dart';

class MyImanPage extends StatelessWidget {
  const MyImanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const DateNotificationWidget(),
            const SizedBox(
              height: 20,
            ),
            PrayerTimeWidget(),
            const SizedBox(
              height: 20,
            ),
            const QiblaTasbihWidget()
          ],
        ),
      ),
    ));
  }
}
