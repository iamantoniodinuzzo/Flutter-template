import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/COMMON/theme/custom_colors.dart';

@immutable
class CustomColorScheme {
  const CustomColorScheme._();

  static ColorScheme lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: CustomColors.azure,
    onPrimary: CustomColors.black,
    secondary: CustomColors.blue,
    onSecondary: CustomColors.grey,
    error: CustomColors.red,
    onError: CustomColors.white,
    background: CustomColors.azure,
    onBackground: CustomColors.black,
    surface: CustomColors.azure,
    onSurface: CustomColors.black,
  );
}
