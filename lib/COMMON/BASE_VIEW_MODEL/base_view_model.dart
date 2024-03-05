import 'package:flutter/material.dart';

/// BaseViewModel è una classe astratta che estende ChangeNotifier per fornire
/// funzionalità comuni necessarie nei modelli di vista.
abstract class BaseViewModel extends ChangeNotifier {
  //----------------------------------------------------------------------------
  // Parametri di classe
  //----------------------------------------------------------------------------

  /// Il contesto (BuildContext) associato a questa vista. Deve essere inizializzato
  /// prima di utilizzare qualsiasi funzionalità del modello di vista.
  late BuildContext context;
  /// Indica se il widget associato a questo modello di vista è attualmente montato.
  bool mounted = true;

  //----------------------------------------------------------------------------

  //----------------------------------------------------------------------------
  // METODI DI CLASSE
  //----------------------------------------------------------------------------

  /// Override del metodo `dispose` fornito da ChangeNotifier per eseguire
  /// le pulizie necessarie quando il modello di vista viene rimosso.
  @override
  void dispose() {
    mounted = false;
    super.dispose();
  }

  /// Override del metodo `notifyListeners` fornito da ChangeNotifier.
  /// Questo metodo notifica gli ascoltatori solo se il widget è attualmente montato.
  @override
  void notifyListeners() {
    if (!mounted) return;
    super.notifyListeners();
  }

  //----------------------------------------------------------------------------
}