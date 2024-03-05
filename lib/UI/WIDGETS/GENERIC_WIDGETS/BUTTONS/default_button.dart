import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/COMMON/THEME/custom_text_style.dart';
import 'package:flutter_template_mobile/COMMON/UTIL/extensions/extensions.dart';
import 'package:flutter_template_mobile/COMMON/theme/custom_colors.dart';
import 'package:flutter_template_mobile/COMMON/theme/custom_dimensions.dart';

/// Le colorazioni possibili del pulsante.
enum ButtonColor {
  blue(color: CustomColors.blue),
  white(color: CustomColors.white),
  transparent(color: CustomColors.transparent);

  final Color color;

  const ButtonColor({required this.color});
}

/// Le colorazioni possibili per il testo del pulsante.
enum ButtonTextColor {
  white(color: CustomColors.white),
  blue(color: CustomColors.blue);

  final Color color;

  const ButtonTextColor({required this.color});
}

enum ButtonTextDimension {
  large(dimension: CustomDimensions.headlineLarge),
  medium(dimension: CustomDimensions.headlineMedium),
  small(dimension: CustomDimensions.headlineSmall);

  final double dimension;

  const ButtonTextDimension({required this.dimension});
}

/// Rappresenta un button di default che segue gli stili definiti dal design system
/// Utilizza un'altezza predefinita [CustomDimensions.baseButtonHeight] e sovrascrivibile.
/// Utilizza un'ampiezza predefinita alla dimensione dello schermo e sovrascrivibile.
class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.onPress,
    this.height,
     this.width,
    this.icon,
    this.borderColor,
    this.textColor,
    this.iconColor,
    this.iconSize,
    this.isEnabled = true,
  });

  /// Costruttore di default per un pulsante secondario
  const DefaultButton.secondary({
    this.onPress,
    required this.buttonText,
    this.height,
    this.width,
    this.icon,
    this.iconColor,
    this.iconSize,
    super.key,
    this.isEnabled = true,
  })  : buttonColor = ButtonColor.white,
        textColor = ButtonTextColor.blue,
        borderColor = null;

  /// Costruttore di default per un pulsante primario
  const DefaultButton.primary({
    super.key,
    this.onPress,
    required this.buttonText,
    this.height,
    this.width,
    this.icon,
    this.borderColor,
    this.iconColor,
    this.iconSize,
    this.isEnabled = true,
  })  : buttonColor = ButtonColor.blue,
        textColor = ButtonTextColor.white;

  final void Function()? onPress;
  final String buttonText;
  final ButtonColor buttonColor;
  final double? height;
  final double? width;
  final IconData? icon;
  final ButtonColor? borderColor;
  final ButtonTextColor? textColor;
  final Color? iconColor;
  final double? iconSize;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? CustomDimensions.baseButtonHeight,
      width: width ?? context.mediaQuery.size.width,
      child: ElevatedButton(
        onPressed: isEnabled ? onPress : null,
        style: context.theme.elevatedButtonTheme.style?.copyWith(
          backgroundColor: MaterialStatePropertyAll(
            isEnabled ? buttonColor.color : CustomColors.grey,
          ),
        ),
        child: (icon != null) ? _buildIconWithTextButton() : _buildTextButton(),
      ),
    );
  }

  /// Costruisce un semplice testo
  Text _buildTextButton() {
    return Text(
      buttonText,
      style: CustomTextStyle.buttonLabelStyle.copyWith(
        color: textColor?.color,
      ),
    );
  }

  /// Costruisce una riga contenente un'icona e un testo
  Row _buildIconWithTextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize ?? CustomDimensions.defaultIconSize,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          buttonText,
          style: CustomTextStyle.buttonLabelStyle.copyWith(
            color: textColor?.color,
          ),
        ),
      ],
    );
  }
}
