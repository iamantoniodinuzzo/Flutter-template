import 'package:flutter/material.dart';

/// Classe che fornisce metodi statici per generare gli endpoint API.
///
/// Gli endpoint sono rappresentati come costanti in [BaseEndpoint] e possono essere combinati
/// per costruire gli URL completi attraverso il metodo statico `base`.
@immutable
class ApiEndpoints {
  const ApiEndpoints._();

  // Restituisce l'endpoint di base (esempio: '/972a9b7a-d53e-45ce-ac60-a4e0fa6251df').
  // Nota: Questo è solo un esempio e dovrebbe essere modificato con l'effettivo endpoint base.
  static String base(BaseEndpoint endpoint, {int? optionalParam}) {
    const path = '/';
    switch (endpoint) {
      case BaseEndpoint.base:
        return path;
      case BaseEndpoint.foo:
        return '$path/foo';
      case BaseEndpoint.bar:
        return '$path/bar';
      case BaseEndpoint.baz:
        return '$path/baz';
    }
  }
}

/// Enumerazione che rappresenta gli endpoint di base disponibili.
enum BaseEndpoint {
  base,
  foo,
  bar,
  baz;
}
