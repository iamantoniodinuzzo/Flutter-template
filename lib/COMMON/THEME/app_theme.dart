import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/COMMON/THEME/custom_button_theme.dart';
import 'package:flutter_template_mobile/COMMON/THEME/custom_color_scheme.dart';
import 'package:flutter_template_mobile/COMMON/THEME/custom_colors.dart';
import 'package:flutter_template_mobile/COMMON/THEME/custom_text_theme.dart';

@immutable
class AppTheme {
  const AppTheme._();

  /// Light Theme
  static ThemeData lightTheme = ThemeData(
      useMaterial3: false,
      fontFamily: 'Nunito',
      brightness: Brightness.light,
      primaryColor: CustomColors.blue,
      scaffoldBackgroundColor: CustomColors.white,
      textTheme: CustomTextTheme.lightTextTheme,
      buttonTheme: CustomButtonTheme.buttonThemeLight ,
      colorScheme: CustomColorScheme.lightColorScheme ,
  );

  ///Dark Theme
  static ThemeData darkTheme = ThemeData();
}
