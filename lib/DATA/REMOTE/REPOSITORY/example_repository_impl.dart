import 'package:flutter_template_mobile/DOMAIN/REMOTE/REPOSITORY/example_repository.dart';
import 'package:flutter_template_mobile/data/remote/SERVICES/example_service.dart';

class ExampleRepositoryImpl implements ExampleRepository {
  final ExampleService _service;

  ExampleRepositoryImpl({required ExampleService service}) : _service = service;

  @override
  Future<void> exampleSOAP() async {
    await _service.soapExample();
  }
}
