import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class LoadSettingsEvent extends SettingsEvent {}

class ChangeNotificationValueEvent extends SettingsEvent {
  final bool notificationValue;

  const ChangeNotificationValueEvent(this.notificationValue);
}
