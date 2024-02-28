import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seerah/src/core/error/failures.dart';
import 'package:seerah/src/features/settings/domain/repositories/city_repository.dart';
import 'package:seerah/src/features/settings/presentation/bloc/cities_cubit/cities_event.dart';
import 'package:seerah/src/features/settings/presentation/bloc/cities_cubit/cities_state.dart';

const serverFailureMessage = 'Server Failure';
const cachedFailureMassage = 'Cache Failure';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  final CityRepository cityRepository;

  CitiesBloc({required this.cityRepository}) : super(CitiesEmpty()) {
    on<LoadCitiesEvent>(_onLoadCitiesEvent);
    on<ChangeCityEvent>(_onChangeCityEvent);
  }

  FutureOr<void> _onLoadCitiesEvent(
      CitiesEvent event, Emitter<CitiesState> emit) async {
    final failureOrCities = await cityRepository.getCities();
    final failureOrCity = await cityRepository.getCity();

    emit(failureOrCities.fold(
          (failure) => CitiesError(message: _mapFailureToMessage(failure)),
          (cities) {
        return failureOrCity.fold(
              (failure) => CitiesError(message: _mapFailureToMessage(failure)),
              (city) => CitiesLoaded(cities, city),
        );
      },
    ));
  }

  FutureOr<void> _onChangeCityEvent(
      ChangeCityEvent event, Emitter<CitiesState> emit) async {
    await cityRepository.saveCity(event.city);
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
