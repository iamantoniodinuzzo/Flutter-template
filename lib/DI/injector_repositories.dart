import 'package:flutter_template_mobile/DOMAIN/REMOTE/REPOSITORY/example_repository.dart';
import 'package:flutter_template_mobile/data/remote/SERVICES/example_service.dart';
import 'package:flutter_template_mobile/data/remote/repository/example_repository_impl.dart';
import 'package:flutter_template_mobile/di/injector.dart';

/// Inizializza i repository all'interno del sistema di dependency injection.
void initializeRepositories() {
  // Registra una factory per creare istanze,
  // iniettando il singleton di ExampleService,
  // e la registra nel container di dependency injection.
  getIt.registerFactory<ExampleRepository>(
    () => ExampleRepositoryImpl(
      service: getIt<ExampleService>(),
    ),
  );
}
