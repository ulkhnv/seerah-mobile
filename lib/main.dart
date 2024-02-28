import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:seerah/src/core/utils/S.dart';
import 'package:seerah/src/core/utils/localization_provider.dart';
import 'package:seerah/src/core/utils/service_locator.dart' as di;
import 'package:seerah/src/core/utils/service_locator.dart';
import 'package:seerah/src/features/home/home_page.dart';
import 'package:seerah/src/features/my_iman/presentation/bloc/prayer_time_cubit/prayer_time_cubit.dart';
import 'package:seerah/src/features/settings/presentation/bloc/cities_cubit/cities_bloc.dart';
import 'package:seerah/src/features/settings/presentation/bloc/settings_bloc/settings_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const SeerahApp());
}

class SeerahApp extends StatelessWidget {
  const SeerahApp({super.key});

  @override
  Widget build(BuildContext context) {
    systemUIConfiguration();
    return MultiBlocProvider(
        providers: [
          BlocProvider<CitiesBloc>(create: (context) => sl<CitiesBloc>()),
          BlocProvider<PrayerTimeCubit>(
              create: (context) => sl<PrayerTimeCubit>()..loadPrayerTime()),
          BlocProvider<SettingsBloc>(create: (context) => sl<SettingsBloc>()),
        ],
        child: ChangeNotifierProvider(
          create: (context) => di.sl<LocalizationProvider>(),
          child: Consumer<LocalizationProvider>(
            builder: (context, localizationProvider, _) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                supportedLocales: S.supportedLocales,
                locale: localizationProvider.locale,
                localizationsDelegates: S.localizationDelegates,
                theme: ThemeData(
                  fontFamily: "Rubik",
                  useMaterial3: true,
                ),
                home: const HomePage(),
              );
            },
          ),
        ));
  }

  void systemUIConfiguration() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }
}
