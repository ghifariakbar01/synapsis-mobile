import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'app/app.dart';
import 'di/di_container.dart';
import 'di/di_initializer.dart';

//^
//^ Edit router.dart for Initial route
//^

Future<void> run([
  List<DeviceOrientation> orientations = const [
    DeviceOrientation.portraitUp,
  ],
]) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(orientations);

  await initDI(diContainer, 'dev');

  _runApp();
}

void _runApp() {
  runApp(const MyApp());
}
