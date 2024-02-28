import 'package:flutter/material.dart';
import 'package:seerah/src/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LanguageLocalDataSource {
  Future<Locale> getLanguage();

  Future<void> setLanguage(String locale);
}

const _cachedLanguage = 'cachedLanguage';

class LanguageLocalDataSourceImpl implements LanguageLocalDataSource {
  final SharedPreferences sharedPreferences;

  LanguageLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Locale> getLanguage() {
    final language = sharedPreferences.getString(_cachedLanguage);
    if (language != null) {
      return Future.value(Locale(language));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> setLanguage(String language) {
    return sharedPreferences.setString(_cachedLanguage, language);
  }
}
