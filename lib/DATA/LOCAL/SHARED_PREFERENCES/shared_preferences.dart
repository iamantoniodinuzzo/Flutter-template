import 'package:flutter/foundation.dart' show immutable;
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class SharedPrefs {
  const SharedPrefs._();

  /// Ottiene i dati memorizzati nelle preferenze condivise.
  ///
  /// Restituisce una [Future] contenente una stringa, o `null` se non è presente alcun dato.
  static Future<String?> getDataFromShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString("data");
    return data;
  }

  /// Imposta i dati nelle preferenze condivise.
  ///
  /// [data]: La stringa da memorizzare nelle preferenze condivise.
  static Future<void> setDataToShared(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("data", data);
  }

  /// Cancella i dati memorizzati nelle preferenze condivise.
  static Future<void> clearDataFromShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("data");
  }
}
