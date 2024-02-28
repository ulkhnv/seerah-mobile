import 'package:shared_preferences/shared_preferences.dart';

abstract class NotificationLocalDataSource {
  Future<bool> getNotificationValue();

  Future<void> setNotificationValue(bool value);
}

const _cachedNotificationValue = 'cachedNotificationValue';

class NotificationLocalDataSourceImpl extends NotificationLocalDataSource {
  final SharedPreferences sharedPreferences;

  NotificationLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> getNotificationValue() {
    return Future.value(sharedPreferences.getBool(_cachedNotificationValue));
  }

  @override
  Future<void> setNotificationValue(bool value) {
    return sharedPreferences.setBool(_cachedNotificationValue, value);
  }
}
