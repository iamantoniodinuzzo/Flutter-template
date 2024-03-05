import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/COMMON/THEME/custom_colors.dart';
import 'package:flutter_template_mobile/COMMON/THEME/custom_dimensions.dart';
import 'package:flutter_template_mobile/COMMON/THEME/custom_text_style.dart';

@immutable
class CustomTextTheme {
  const CustomTextTheme._();

  ///Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    //*Headline
    headlineLarge: CustomTextStyle.headlineMediumBold.copyWith(
      color: CustomColors.black,
    ),
    headlineMedium: CustomTextStyle.headlineMediumBold.copyWith(
      color: CustomColors.black,
    ),
    headlineSmall: CustomTextStyle.headlineSmallBold.copyWith(
      color: CustomColors.black,
    ),

    //*Title
    titleLarge: CustomTextStyle.title.copyWith(
      fontSize: CustomDimensions.title,
      fontWeight: FontWeight.w600,
      color: CustomColors.black,
    ),

    //*Body
    bodyLarge: CustomTextStyle.body.copyWith(
      color: CustomColors.black,
    ),

    //*Label
    labelLarge: const TextStyle().copyWith(
      fontSize: CustomDimensions.label,
      fontWeight: FontWeight.normal,
      color: CustomColors.black,
    ),
  );

  ///Customizable Dark Text Theme
  static TextTheme darkTextTheme = const TextTheme();
}
