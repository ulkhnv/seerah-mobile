import 'package:dartz/dartz.dart';
import 'package:seerah/src/core/error/failures.dart';
import 'package:seerah/src/features/settings/domain/entities/city.dart';

abstract class CityRepository {
  Future<Either<Failure, List<City>>> getCities();

  Future<Either<Failure, City>> getCity();

  Future<void> saveCity(City city);
}
