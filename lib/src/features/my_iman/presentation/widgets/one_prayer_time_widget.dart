import 'package:flutter/material.dart';
import 'package:seerah/src/core/utils/S.dart';

class OnePrayerTimeWidget extends StatelessWidget {
  final int index;
  final String time;
  final bool current;
  final bool active;

  const OnePrayerTimeWidget({
    super.key,
    required this.index,
    required this.time,
    this.active = true,
    this.current = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45,
          color: current ? Colors.green.shade50 : null,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: _getImage(),
              ),
              const SizedBox(
                width: 20,
              ),
              _getName(context),
              const Spacer(),
              Text(
                time,
                style: TextStyle(
                  fontSize: 20,
                  color: active ? Colors.black : Colors.grey.shade500,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Image.asset(
                  "assets/images/my_iman/sound.png",
                  width: 25,
                  height: 25,
                ),
              )
            ],
          ),
        ),
         SizedBox(height: index == 5 ? 20 : 5)
      ],
    );
  }

  Image _getImage() {
    final String url;
    switch (index) {
      case 0:
        url = "assets/images/my_iman/fajr.png";
      case 1:
        url = "assets/images/my_iman/sunrise.png";
      case 2:
        url = "assets/images/my_iman/zuhr.png";
      case 3:
        url = "assets/images/my_iman/asr.png";
      case 4:
        url = "assets/images/my_iman/magrib.png";
      case 5:
        url = "assets/images/my_iman/isha.png";
      default:
        url = "";
    }
    return Image.asset(
      url,
      color: active ? Colors.black : Colors.grey.shade500,
      width: 25,
      height: 25,
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
          fontSize: 20, color: active ? Colors.black : Colors.grey.shade500),
    );
  }
}
