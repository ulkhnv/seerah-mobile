import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seerah/src/core/utils/S.dart';
import 'package:seerah/src/features/settings/presentation/bloc/settings_bloc/settings_bloc.dart';
import 'package:seerah/src/features/settings/presentation/bloc/settings_bloc/settings_event.dart';
import 'package:seerah/src/features/settings/presentation/bloc/settings_bloc/settings_state.dart';
import 'package:seerah/src/features/settings/presentation/widget/about_card_widget.dart';
import 'package:seerah/src/features/settings/presentation/widget/city_card_widget.dart';
import 'package:seerah/src/features/settings/presentation/widget/language_card_widget.dart';
import 'package:seerah/src/features/settings/presentation/widget/notification_card_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SettingsBloc>(context, listen: false)
        .add(LoadSettingsEvent());

    return BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).settings,
            style: const TextStyle(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              CityCard(
                city: state is SettingsLoaded ? state.city : "?",
              ),
              const SizedBox(
                height: 10,
              ),
              const LanguageCard(),
              const SizedBox(
                height: 10,
              ),
              const AboutCard(),
              const SizedBox(
                height: 10,
              ),
              NotificationCard(notificationValue : state is SettingsLoaded ? state.notificationValue: false),
            ],
          ),
        ),
      );
    });
  }
}
