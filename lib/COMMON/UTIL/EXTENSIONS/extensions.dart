import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/COMMON/NETWORK/response_state.dart';

/// Estensione sulla classe [Response] per aggiungere un metodo `succeeded`.
extension Succeded on Response {
  /// Verifica se la risposta è stata un successo in base al codice di stato HTTP.
  ///
  /// Restituisce `true` se lo stato della risposta è diverso da `null` e uguale a 200 (OK).
  ///
  /// Esempio:
  /// ```dart
  /// final response = //... ottieni la tua risposta da qualche parte
  /// if (response.succeeded()) {
  ///   // Gestisci il caso di successo
  /// } else {
  ///   // Gestisci il caso di errore
  /// }
  /// ```
  bool succeeded() {
    return statusCode != null && statusCode! == 200;
  }
}

/// Estensione sulla classe [ResponseState] con generico booleano.
/// Valuta se è valido, ovvero se è un'istanza di [Success] e il campo `data` è `true`.
extension IsValid on ResponseState<bool> {
  /// Verifica se lo stato della risposta è valido, considerando il generico booleano [Success.data].
  ///
  /// Restituisce `true` se lo stato è un'istanza di [Success] e il campo `data` è `true`.
  ///
  /// Esempio:
  /// ```dart
  /// final responseState = //... ottieni il tuo stato di risposta da qualche parte
  /// if (responseState.isValid()) {
  ///   // Gestisci il caso in cui lo stato è valido
  /// } else {
  ///   // Gestisci il caso in cui lo stato non è valido
  /// }
  /// ```
  bool isValid() {
    return this is Success && (this as Success).data;
  }
}

/// Estensioni sulla classe [BuildContext] per semplificare l'accesso alle informazioni di tema e ad altri elementi del framework Flutter.
extension BuildContextExtensions on BuildContext {
  /// Restituisce l'oggetto [ThemeData] corrente associato a questo [BuildContext].
  ThemeData get theme => Theme.of(this);

  /// Restituisce l'oggetto [TextTheme] associato al tema corrente di questo [BuildContext].
  TextTheme get textTheme => theme.textTheme;

  /// Restituisce l'oggetto [ColorScheme] associato al tema corrente di questo [BuildContext].
  ColorScheme get colorScheme => theme.colorScheme;

  /// Restituisce l'oggetto [MediaQueryData] associato a questo [BuildContext].
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Restituisce lo stato [ScaffoldState] associato a questo [BuildContext].
  ScaffoldState get scaffold => Scaffold.of(this);

  /// Restituisce lo stato [ScaffoldMessengerState] associato a questo [BuildContext].
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}

/// Estensioni su [Iterable<MaterialState>] per semplificare la verifica dello stato del materiale.
extension MaterialStateHelpers on Iterable<MaterialState> {
  /// Restituisce true se lo stato [MaterialState.hovered] è presente nell'iterabile.
  bool get isHovered => contains(MaterialState.hovered);

  /// Restituisce true se lo stato [MaterialState.focused] è presente nell'iterabile.
  bool get isFocused => contains(MaterialState.focused);

  /// Restituisce true se lo stato [MaterialState.pressed] è presente nell'iterabile.
  bool get isPressed => contains(MaterialState.pressed);

  /// Restituisce true se lo stato [MaterialState.dragged] è presente nell'iterabile.
  bool get isDragged => contains(MaterialState.dragged);

  /// Restituisce true se lo stato [MaterialState.selected] è presente nell'iterabile.
  bool get isSelected => contains(MaterialState.selected);

  /// Restituisce true se lo stato [MaterialState.scrolledUnder] è presente nell'iterabile.
  bool get isScrolledUnder => contains(MaterialState.scrolledUnder);

  /// Restituisce true se lo stato [MaterialState.disabled] è presente nell'iterabile.
  bool get isDisabled => contains(MaterialState.disabled);

  /// Restituisce true se lo stato [MaterialState.error] è presente nell'iterabile.
  bool get isError => contains(MaterialState.error);
}
