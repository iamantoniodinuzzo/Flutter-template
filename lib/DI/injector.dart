import 'package:get_it/get_it.dart';

import 'injector_repositories.dart';
import 'injector_services.dart';

/// The GetIt dependency injection container instance.
final getIt = GetIt.instance;

/// Flag to ensure initialization occurs only once.
bool _initialized = false;

/// Initializes all dependencies, including services and repositories.
serviceLocatorInitialization() {
  // Checks if initialization has not been performed before.
  if (!_initialized) {
    // Calls functions to initialize services and repositories.
    initializeServices();
    initializeRepositories();

    // Marks the initialization as complete.
    _initialized = true;
  }
}
