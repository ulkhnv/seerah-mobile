import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:seerah/src/core/network/network_info.dart';
import 'package:seerah/src/core/utils/localization_provider.dart';
import 'package:seerah/src/features/my_iman/presentation/bloc/prayer_time_cubit/prayer_time_cubit.dart';
import 'package:seerah/src/features/settings/data/datasources/city_local_data_source.dart';
import 'package:seerah/src/features/settings/data/datasources/city_remote_data_source.dart';
import 'package:seerah/src/features/settings/data/datasources/language_local_data_source.dart';
import 'package:seerah/src/features/settings/data/datasources/notification_local_data_source.dart';
import 'package:seerah/src/features/settings/data/repositories/city_repository_impl.dart';
import 'package:seerah/src/features/settings/domain/repositories/city_repository.dart';
import 'package:seerah/src/features/settings/presentation/bloc/cities_cubit/cities_bloc.dart';
import 'package:seerah/src/features/settings/presentation/bloc/settings_bloc/settings_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC / Cubit
  sl.registerFactory(
    () => SettingsBloc(cityRepository: sl(), notificationLocalDataSource: sl()),
  );

  sl.registerFactory(
    () => CitiesBloc(cityRepository: sl()),
  );

  sl.registerFactory(() => PrayerTimeCubit());

  // Repository
  sl.registerLazySingleton<CityRepository>(() => CityRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<CityRemoteDataSource>(
    () => CityRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<CityLocalDataSource>(
    () => CityLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<LanguageLocalDataSource>(
    () => LanguageLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<NotificationLocalDataSource>(
    () => NotificationLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // Core
  sl.registerLazySingleton(
      () => LocalizationProvider(languageLocalDataSource: sl()));

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
