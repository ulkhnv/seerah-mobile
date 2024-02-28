import 'package:equatable/equatable.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsEmpty extends SettingsState {
  const SettingsEmpty();

  @override
  List<Object> get props => [];
}

class SettingsLoaded extends SettingsState {
  final String city;
  final bool notificationValue;

  const SettingsLoaded(this.city, this.notificationValue);

  @override
  List<Object> get props => [city];
}

class SettingsError extends SettingsState {
  final String message;

  const SettingsError({required this.message});

  @override
  List<Object> get props => [message];
}
