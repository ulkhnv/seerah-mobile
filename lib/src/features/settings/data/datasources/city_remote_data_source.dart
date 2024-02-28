import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seerah/src/core/error/exceptions.dart';
import 'package:seerah/src/features/settings/domain/entities/city.dart';

abstract class CityRemoteDataSource {
  Future<List<City>> getCities();
}

class CityRemoteDataSourceImpl implements CityRemoteDataSource {
  final http.Client client;

  CityRemoteDataSourceImpl({required this.client});

  @override
  Future<List<City>> getCities() =>
      _getCitiesFromUrl("https://seerah.kz/backend/api/salah/cities?limit=200");

  Future<List<City>> _getCitiesFromUrl(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final cities = jsonDecode(response.body);
      return (cities["result"] as List)
          .map((city) => City.fromJson(city as Map<String, dynamic>))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
