import 'package:dartz/dartz.dart';
import 'package:seerah/src/core/error/exceptions.dart';
import 'package:seerah/src/core/error/failures.dart';
import 'package:seerah/src/core/network/network_info.dart';
import 'package:seerah/src/features/settings/data/datasources/city_local_data_source.dart';
import 'package:seerah/src/features/settings/data/datasources/city_remote_data_source.dart';
import 'package:seerah/src/features/settings/domain/entities/city.dart';
import 'package:seerah/src/features/settings/domain/repositories/city_repository.dart';

class CityRepositoryImpl implements CityRepository {
  final CityRemoteDataSource remoteDataSource;
  final CityLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CityRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<City>>> getCities() async {
    if (await networkInfo.isConnected) {
      try {
        final cities = await remoteDataSource.getCities();
        await localDataSource.setCities(cities);
        return Right(cities);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cities = await localDataSource.getCities();
        return Right(cities);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, City>> getCity() async {
    try {
      final city = await localDataSource.getCity();
      return Right(city);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<void> saveCity(City city) {
    return localDataSource.setCity(city);
  }
}
