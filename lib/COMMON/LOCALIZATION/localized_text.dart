// ignore_for_file: constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:enum_to_string/enum_to_string.dart';

enum LocalizedText {
  WELCOME_LABEL,
  NAVIGATE_LABEL
}

extension LocalizedTextExtension on LocalizedText {
  ///
  String translate(){
    return tr(EnumToString.convertToString(this));
  }
}
