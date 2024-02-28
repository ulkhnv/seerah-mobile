import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:seerah/src/core/utils/S.dart';
import 'package:seerah/src/features/settings/presentation/bloc/settings_bloc/settings_bloc.dart';
import 'package:seerah/src/features/settings/presentation/bloc/settings_bloc/settings_event.dart';
import 'package:seerah/src/features/settings/presentation/widget/border_container_widget.dart';

class NotificationCard extends StatefulWidget {
  final bool notificationValue;

  const NotificationCard({super.key, required this.notificationValue});

  @override
  NotificationCardState createState() => NotificationCardState();
}

class NotificationCardState extends State<NotificationCard> {
  late bool _notificationValue;

  @override
  void initState() {
    super.initState();
    _notificationValue = widget.notificationValue;
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SettingsBloc>();
    return BorderContainer(
      padding: 20,
      child: Row(
        children: [
          Image.asset(
            "assets/images/settings/notification.png",
            color: Colors.green,
            width: 25,
            height: 25,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            S.of(context).notification,
            style: const TextStyle(fontSize: 20),
          ),
          const Spacer(),
          FlutterSwitch(
            width: 45,
            padding: 2,
            height: 25,
            toggleSize: 20,
            activeColor: Colors.green,
            value: _notificationValue,
            onToggle: (val) {
              setState(() {
                bloc.add(ChangeNotificationValueEvent(val));
                _notificationValue = val;
              });
            },
          ),
        ],
      ),
    );
  }
}
