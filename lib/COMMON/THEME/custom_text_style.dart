import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/COMMON/theme/custom_dimensions.dart';

@immutable
class CustomTextStyle {
  const CustomTextStyle._();

//Si sconsiglia di inserire qui il colore del testo
//in quanto dovrebbe essere settato in 'custom_text_theme'
//permettendo una distinzione del tema chiaro e tema scuro.

  //*  Primary Font Styles
  static TextStyle headlineLargeBold = const TextStyle(
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    fontSize: CustomDimensions.headlineLarge,
  );

  static TextStyle headlineMediumBold = const TextStyle(
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    fontSize: CustomDimensions.headlineMedium,
  );

  static TextStyle headlineSmallBold = const TextStyle(
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    fontSize: CustomDimensions.headlineSmall,
  );

  static TextStyle title = const TextStyle(
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    fontSize: CustomDimensions.title,
  );

  static TextStyle body = const TextStyle(
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    fontSize: CustomDimensions.body,
  );

  static TextStyle primaryH1Regular = const TextStyle(
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    fontSize: CustomDimensions.headlineLarge,
  );

  static TextStyle primaryPRegular = const TextStyle(
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: CustomDimensions.body,
  );

  static TextStyle primaryPBold = const TextStyle(
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    fontSize: CustomDimensions.body,
  );

  //* Secondary Font Styles
  static TextStyle secondaryH1Bold = const TextStyle(
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: CustomDimensions.headlineLarge,
  );

  static TextStyle secondaryH1Regular = const TextStyle(
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: CustomDimensions.headlineLarge,
  );

  static TextStyle secondaryPRegular = const TextStyle(
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
    fontSize: CustomDimensions.body,
  );

  static TextStyle secondaryPBold = const TextStyle(
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: CustomDimensions.body,
  );

  //* Buttons text style

  static TextStyle buttonLabelStyle = const TextStyle(
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: CustomDimensions.labelMedium,
  );

  //* TextField style

  static TextStyle textFieldLabelStyle = const TextStyle(
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    fontSize: CustomDimensions.label,
  );

  static TextStyle textFieldFocusedLabelStyle = const TextStyle(
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: CustomDimensions.labelMedium,
  );
}
