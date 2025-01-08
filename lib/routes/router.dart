import 'package:alice/alice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../di/di_container.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/device_management/presentation/pages/register_page.dart';
import '../features/on_duty/presentation/pages/on_duty_page.dart';
import '../features/unit_management/presentation/pages/unit_management_page.dart';

// final List<NavDestination> destinations = [
//   const NavDestination(
//     label: 'Settings 2',
//     icon: Icon(Icons.library_books_outlined),
//     selectedIcon: Icon(Icons.library_books),
//     screen: RegisterPage(),
//   ),
//   const NavDestination(
//     label: 'Settings',
//     icon: Icon(Icons.settings),
//     selectedIcon: Icon(Icons.settings_applications),
//     screen: RegisterPage(),
//   ),
//   const NavDestination(
//     label: 'Profile',
//     icon: Icon(Icons.settings),
//     selectedIcon: Icon(Icons.settings_applications),
//     screen: RegisterPage(),
//   ),
// ];

class Routes {
  static const app = '/';

  //* Login & Registrasi
  static const loginScreen = 'loginScreen';
  static const registScreen = 'registScreen';

  static const processScreen = 'processScreen';
  static const onDutyScreen = 'onDutyScreen';
}

final appNavigatorKey = diContainer<Alice>().getNavigatorKey();

class NavigationService {
  final appRoutes = {
    Routes.app: (_) => Container(),
    Routes.loginScreen: (_) => const LoginPage(),
    Routes.processScreen: (_) => const UnitManagementPage(),
    Routes.onDutyScreen: (_) => const OnDutyPage(),
    Routes.registScreen: (_) => const RegisterPage(),
  };

  // iOS: full screen routes pop up from the bottom and disappear vertically too
  // On iOS that's a standard full screen dialog
  // Has no effect on Android.
  final Set<String> _fullScreenRoutes = {};

  // iOS transition: Pages that slides in from the right and exits in reverse.
  final Set<String> _cupertinoRoutes = {};

  static NavigationService of(BuildContext context) =>
      RepositoryProvider.of<NavigationService>(context);

  Future<dynamic> navigateTo(
    String routeName, [
    Object? arguments,
    bool replace = false,
  ]) async {
    if (appRoutes[routeName] != null) {
      print('routeName: $routeName');
      print('appNavigatorKey.currentState: ${appNavigatorKey?.currentState}');

      return replace
          ? appNavigatorKey?.currentState
              ?.pushReplacementNamed(routeName, arguments: arguments)
          : appNavigatorKey?.currentState
              ?.pushNamed(routeName, arguments: arguments);
    }
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return appRoutes[settings.name!] != null
        ? _cupertinoRoutes.contains(settings.name)
            ? CupertinoPageRoute(
                settings: settings,
                builder: (_) => appRoutes[settings.name]!(settings.arguments),
                fullscreenDialog: _fullScreenRoutes.contains(settings.name),
              )
            : MaterialPageRoute(
                settings: settings,
                builder: (_) => appRoutes[settings.name]!(settings.arguments),
                fullscreenDialog: _fullScreenRoutes.contains(settings.name),
              )
        : MaterialPageRoute(builder: (_) => Container());
  }

  Future<dynamic> pushAndRemoveAll(
    String routeName, [
    Object? arguments,
  ]) async {
    print('routeName: ${routeName}');
    return appNavigatorKey?.currentState
        ?.pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}
