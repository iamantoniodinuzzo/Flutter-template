import 'package:flutter/material.dart';

@immutable
class BoxNames {
  const BoxNames._();

  static const String _todoBox = 'todoBox';

  static String get todo => _todoBox;
}
