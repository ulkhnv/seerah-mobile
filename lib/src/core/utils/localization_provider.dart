import 'package:flutter/material.dart';
import 'package:seerah/src/features/settings/data/datasources/language_local_data_source.dart';

class LocalizationProvider extends ChangeNotifier {
  final LanguageLocalDataSource languageLocalDataSource;
  Locale _locale = const Locale("kk");

  LocalizationProvider({required this.languageLocalDataSource}) {
    loadLocale();
  }

  Locale get locale => _locale;

  Future<void> loadLocale() async {
    _locale = await languageLocalDataSource.getLanguage();
    notifyListeners();
  }

  void setLocale(Locale newLocale) {
    languageLocalDataSource.setLanguage(newLocale.languageCode);
    _locale = newLocale;
    notifyListeners();
  }
}
