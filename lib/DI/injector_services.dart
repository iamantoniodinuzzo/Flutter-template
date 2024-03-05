import 'package:flutter_template_mobile/data/remote/SERVICES/example_service.dart';

import '../COMMON/NETWORK/dio_client.dart';
import 'injector.dart';

/// Inizializza e registra istanze singleton per i servizi utilizzando il container di dependency injection.
void initializeServices() {
  // Crea un'istanza singleton di DioClient e la registra nel container di dependency injection.
  getIt.registerSingleton<DioClient>(DioClient());

  // Crea un'istanza singleton di ExampleService e la registra nel container di dependency injection,
  // iniettando il singleton di DioClient nel costruttore.
  getIt.registerSingleton<ExampleService>(
    ExampleService(dioClient: getIt<DioClient>()),
  );
}
