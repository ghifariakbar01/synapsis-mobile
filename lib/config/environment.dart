import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'build_type.dart';

/// A class for managing environment configurations based on different
/// build types.
class Environment implements Listenable {
  Environment._(this._currentBuildType, Dio config)
      : _config = ValueNotifier<Dio>(config),
        _listeners = [];

  /// Creates a new instance of [Environment].
  factory Environment.instance() => _instance as Environment;

  /// The singleton instance of the [Environment].
  static Environment? _instance;

  final BuildType _currentBuildType;
  final List<VoidCallback> _listeners;

  Dio get config => _config.value;

  set config(Dio c) {
    _config.value = c;
    _notifyListeners(); // Notify listeners when the config changes
  }

  /// Checks if the current build type is debug.
  bool get isDebug => _currentBuildType == BuildType.debug;

  /// Checks if the current build type is release.
  bool get isRelease => _currentBuildType == BuildType.release;

  /// Returns the current build type.
  BuildType get buildType => _currentBuildType;

  ValueNotifier<Dio> _config;

  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  /// Notifies all registered listeners that the environment configuration
  /// has changed.
  void _notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }

  /// Initializes the singleton instance of [Environment].
  ///
  /// This method should be called once at the app's initialization to set up
  /// the environment configuration.
  static void init({
    required BuildType buildType,
    required Dio config,
  }) {
    _instance ??= Environment._(buildType, config);
  }
}
