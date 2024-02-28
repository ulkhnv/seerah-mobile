import 'package:equatable/equatable.dart';
import 'package:seerah/src/features/settings/domain/entities/city.dart';

abstract class CitiesEvent extends Equatable {
  const CitiesEvent();

  @override
  List<Object> get props => [];
}

class LoadCitiesEvent extends CitiesEvent {}

class ChangeCityEvent extends CitiesEvent {
  final City city;

  const ChangeCityEvent(this.city);
}
