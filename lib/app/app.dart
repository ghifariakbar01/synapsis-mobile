import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../di/di_container.dart';
import '../generated/l10n.dart';
import '../init/init_bloc.dart';
import '../routes/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider<NavigationService>(
            create: (context) => NavigationService(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<InitBloc>(
              create: (_) => InitBloc(diContainer())..add(StartAppEvent()),
            ),
          ],
          child: Builder(
            builder: (context) {
              final navigator = NavigationService.of(context);

              return MaterialApp(
                debugShowCheckedModeBanner: kDebugMode,
                restorationScopeId: 'app',
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en', ''), // English, no country code
                  Locale('id', ''), // Indonesia, no country code
                ],
                onGenerateTitle: (BuildContext context) =>
                    S.of(context).appTitle,
                navigatorKey: appNavigatorKey,
                onGenerateRoute: navigator.onGenerateRoute,
                builder: (_, child) => BlocListener<InitBloc, InitState>(
                  listener: (_, state) {
                    if (state is Auth) {
                      navigator.pushAndRemoveAll(Routes.onDutyScreen);
                    } else {
                      navigator.pushAndRemoveAll(Routes.registScreen);
                    }
                  },
                  child: child,
                ),
              );
            },
          ),
        ),
      );
}
