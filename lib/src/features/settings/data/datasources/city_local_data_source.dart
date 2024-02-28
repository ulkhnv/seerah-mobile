import 'dart:convert';

import 'package:seerah/src/core/error/exceptions.dart';
import 'package:seerah/src/features/settings/domain/entities/city.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CityLocalDataSource {
  Future<City> getCity();

  Future<void> setCity(City city);

  Future<List<City>> getCities();

  Future<void> setCities(List<City> cities);
}

const _cachedCity = 'cachedCity';
const _cachedCities = 'cachedCities';

class CityLocalDataSourceImpl implements CityLocalDataSource {
  final SharedPreferences sharedPreferences;

  CityLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<City> getCity() {
    final jsonCity = sharedPreferences.getString(_cachedCity);
    if (jsonCity != null) {
      return Future.value(
          City.fromJson(jsonDecode(jsonCity) as Map<String, dynamic>));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> setCity(City city) {
    return sharedPreferences.setString(_cachedCity, jsonEncode(city));
  }

  @override
  Future<List<City>> getCities() {
    final jsonCities = sharedPreferences.getStringList(_cachedCities);
    if (jsonCities!.isNotEmpty) {
      return Future.value(jsonCities
          .map((city) =>
          City.fromJson(jsonDecode(city) as Map<String, dynamic>))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> setCities(List<City> cities) {
    List<String> jsonCities = cities.map((city) => jsonEncode(city)).toList();
    return sharedPreferences.setStringList(_cachedCities, jsonCities);
  }
}
