import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_morty/app/router.dart';
import 'package:rick_morty/app/sl.dart';
import 'package:rick_morty/core/core.dart';
import 'package:rick_morty/features/features.dart';

class RickMortyApp extends StatelessWidget {
  RickMortyApp({super.key});
  final _router = sl<AppRouter>();
  final _theme = RickMortyTheme();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return MultiBlocProvider(
      providers: [
        BlocProvider<CharacterBloc>(
          create: (_) => sl<CharacterBloc>()
            ..add(
              CharacterEvent.getCharacters(),
            ),
        ),
        BlocProvider<EpisodeBloc>(
          create: (_) => sl<EpisodeBloc>()
            ..add(
              EpisodeEvent.getEpisodes(),
            ),
        ),
        BlocProvider<LocationBloc>(
          create: (_) => sl<LocationBloc>()
            ..add(
              LocationEvent.getLocations(),
            ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(344, 760),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (ctx, child) {
          return MaterialApp.router(
            title: AppConstants.APP_NAME,
            routerConfig: _router.config(),
            localizationsDelegates: const [
              Strings.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            builder: (c, child) {
              return MediaQuery(
                data: MediaQuery.of(c).copyWith(
                  textScaler: const TextScaler.linear(1),
                  alwaysUse24HourFormat: true,
                ),
                child:
                    child ?? const Center(child: CircularProgressIndicator()),
              );
            },
            theme: _theme.lightTheme(),
            darkTheme: _theme.darkTheme(),
            // themeMode: state.themeMode,
            // supportedLocales: L10n.all,
            // locale: state.locale,
          );
        },
      ),
    );
  }
}
