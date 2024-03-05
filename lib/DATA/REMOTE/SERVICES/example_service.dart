import 'package:flutter_template_mobile/COMMON/NETWORK/api_endpoint.dart';
import 'package:flutter_template_mobile/COMMON/NETWORK/dio_client.dart';
import 'package:flutter_template_mobile/COMMON/NETWORK/perform_api_call.dart';

import '../RESPONSE/base_response.dart';

class ExampleService {
  final DioClient _dioClient;

  ExampleService({required DioClient dioClient}) : _dioClient = dioClient;

  Future<void> soapExample() async {
    return performApiCall(
      () => _dioClient.get(
        ApiEndpoints.base(
          BaseEndpoint.bar,
        ),
      ),
      (json) => BaseResponse.fromJson(json),
    );
  }
}
