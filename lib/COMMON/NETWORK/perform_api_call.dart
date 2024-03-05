import 'package:dio/dio.dart';
import 'package:flutter_template_mobile/COMMON/NETWORK/exception/api_exception.dart';
import 'package:flutter_template_mobile/COMMON/util/extensions/extensions.dart';

/// Esegue una chiamata API asincrona e gestisce la risposta.
///
/// Questa funzione richiede due parametri:
/// - [apiCall]: Una funzione asincrona che rappresenta la chiamata API.
/// - [fromJson]: Una funzione che converte la risposta JSON in un oggetto di tipo [T].
///
/// Restituisce un [Future<T>] che rappresenta il risultato della chiamata API convertito in un oggetto di tipo [T].
/// Se la chiamata API ha successo, la funzione utilizza la funzione [fromJson] per convertire la risposta JSON.
/// In caso di errore, viene lanciata un'eccezione di tipo [ApiException] contenente i dettagli dell'errore.
Future<T> performApiCall<T>(
  Future<Response> Function() apiCall,
  T Function(Map<String, dynamic> json) fromJson,
) async {
  try {
    // Esegui la chiamata API.
    final response = await apiCall();

    // Verifica se la chiamata API ha avuto successo.
    if (response.succeeded()) {
      // Se ha successo, converte la risposta JSON in un oggetto di tipo T.
      return fromJson(response.data);
    } else {
      // Se non ha successo, solleva un'eccezione di tipo ApiException.
      throw ApiException(response);
    }
  } on DioException catch (error) {
    // Gestisci eventuali eccezioni di tipo DioException sollevate durante la chiamata API.
    throw ApiException(error);
  }
}
