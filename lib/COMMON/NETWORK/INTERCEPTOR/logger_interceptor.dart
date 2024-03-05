import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

/// Interceptor personalizzato per il logging delle richieste e delle risposte HTTP utilizzando la libreria `logger`.
class LoggerInterceptor extends Interceptor {
  final Logger _logger =
  Logger(printer: PrettyPrinter(methodCount: 0, printTime: true));

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Ottieni le opzioni della richiesta in errore.
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';

    // Log di errore.
    _logger.e('${options.method} request ==> $requestPath'); //Error log

    // Log dei dettagli dell'errore.
    _logger.d('Error type: ${err.error} \n '
        'Error message: ${err.message}'); //Debug log

    // Continua con l'errore.
    handler.next(err); //Continue with the Error
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Ottieni il percorso completo della richiesta.
    final requestPath = '${options.baseUrl}${options.path}';

    // Log di informazioni sulla richiesta.
    _logger.i('${options.method} request ==> $requestPath'); //Info log

    // Continua con la richiesta.
    handler.next(options); // continue with the Request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Log dei dettagli della risposta.
    _logger.d('STATUS_CODE: ${response.statusCode} \n '
        'STATUS_MESSAGE: ${response.statusMessage} \n'
        'HEADERS: ${response.headers} \n'
        'RESPONSE_BODY: ${response.data}'); // Debug log

    // Continua con la risposta.
    handler.next(response); // continue with the Response
  }
}