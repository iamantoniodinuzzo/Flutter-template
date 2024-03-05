import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/COMMON/THEME/custom_text_style.dart';
import 'package:flutter_template_mobile/COMMON/theme/custom_colors.dart';
import 'package:flutter_template_mobile/COMMON/theme/custom_dimensions.dart';

@immutable
class CustomButtonTheme {
  const CustomButtonTheme._();

  static ButtonThemeData buttonThemeLight = ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    padding: const EdgeInsets.all(3),
    buttonColor: CustomColors.azure,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(CustomDimensions.buttonRadius),
    ),
  );

  static ElevatedButtonThemeData elevatedButtonThemeLight = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      enableFeedback: true,
      padding: const EdgeInsets.all(3),
      backgroundColor: CustomColors.azure,
      textStyle: CustomTextStyle.buttonLabelStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CustomDimensions.buttonRadius),
      ),
      splashFactory: NoSplash.splashFactory,
    ),
  );
}
