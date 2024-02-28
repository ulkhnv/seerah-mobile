import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seerah/src/core/error/failures.dart';
import 'package:seerah/src/features/settings/data/datasources/notification_local_data_source.dart';
import 'package:seerah/src/features/settings/domain/repositories/city_repository.dart';
import 'package:seerah/src/features/settings/presentation/bloc/settings_bloc/settings_event.dart';
import 'package:seerah/src/features/settings/presentation/bloc/settings_bloc/settings_state.dart';

const serverFailureMessage = 'Server Failure';
const cachedFailureMassage = 'Cache Failure';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final CityRepository cityRepository;
  final NotificationLocalDataSource notificationLocalDataSource;

  SettingsBloc(
      {required this.notificationLocalDataSource, required this.cityRepository})
      : super(const SettingsEmpty()) {
    on<LoadSettingsEvent>(_onLoadSettingsEvent);
    on<ChangeNotificationValueEvent>(_onChangeNotificationValueEvent);
  }

  FutureOr<void> _onLoadSettingsEvent(
      SettingsEvent event, Emitter<SettingsState> emit) async {
    final notificationValue =
        await notificationLocalDataSource.getNotificationValue();
    final failureOrPerson = await cityRepository.getCity();
    emit(failureOrPerson.fold(
        (failure) => SettingsError(message: _mapFailureToMessage(failure)),
        (city) => SettingsLoaded(city.name, notificationValue)));
  }

  FutureOr<void> _onChangeNotificationValueEvent(
      ChangeNotificationValueEvent event, Emitter<SettingsState> emit) async {
    await notificationLocalDataSource
        .setNotificationValue(event.notificationValue);
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
}
