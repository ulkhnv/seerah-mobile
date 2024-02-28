import 'package:equatable/equatable.dart';
import 'package:seerah/src/features/settings/domain/entities/city.dart';

abstract class CitiesState extends Equatable {
  const CitiesState();

  @override
  List<Object> get props => [];
}

class CitiesEmpty extends CitiesState {}

class CitiesLoaded extends CitiesState {
  final List<City> personsList;
  final City currentCity;

  const CitiesLoaded(this.personsList, this.currentCity);

  @override
  List<Object> get props => [personsList, currentCity];
}

class CitiesError extends CitiesState {
  final String message;

  const CitiesError({required this.message});

  @override
  List<Object> get props => [message];
}
