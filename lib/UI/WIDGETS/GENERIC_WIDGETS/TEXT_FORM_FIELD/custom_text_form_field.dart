
import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/COMMON/THEME/custom_colors.dart';
import 'package:flutter_template_mobile/COMMON/THEME/custom_dimensions.dart';
import 'package:flutter_template_mobile/COMMON/THEME/custom_text_style.dart';
import 'package:flutter_template_mobile/COMMON/UTIL/extensions/extensions.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final bool isObscureText;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final Function()? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final bool enabled;
  final String? errorText;
  final Color? errorColor;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isObscureText = false,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction,
    this.validator,
    this.focusNode,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.enabled = true,
    this.errorText,
    this.onChanged,
    this.errorColor,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.isObscureText,
      style: CustomTextStyle.textFieldLabelStyle.copyWith(
        color: widget.enabled
            ? context.theme.colorScheme.onPrimary
            : CustomColors.grey,
      ),
      textInputAction: widget.textInputAction,
      decoration: _buildInputDecoration(context),
      focusNode: widget.focusNode,
      autovalidateMode: widget.autovalidateMode,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      enabled: widget.enabled,
      canRequestFocus: widget.enabled,
      cursorColor: context.theme.colorScheme.primary,
      onChanged: widget.onChanged,
    );
  }

  InputDecoration _buildInputDecoration(BuildContext context) {
    return InputDecoration(
      labelText: widget.hintText,
      errorText: widget.errorText,
      //In questo modo permetto al messaggio di hint di trasformarsi nella label
      floatingLabelStyle: MaterialStateTextStyle.resolveWith(
        (Set<MaterialState> states) {
          //Costruisco il colore per il testo nel caso d'errore o successo
          //Riguardo il colore per l'errore, controllo se è stato fornito in input
          //altrimenti userà quello previsto dal tema
          Color color = states.isError
              ? (widget.errorColor ?? context.colorScheme.error)
              : context.colorScheme.primary;

          return CustomTextStyle.textFieldFocusedLabelStyle.copyWith(
            color: color,
          );
        },
      ),
      floatingLabelAlignment: FloatingLabelAlignment.start,
      filled: false,
      hintStyle: _buildHintStyle(),
      labelStyle: _buildHintStyle(),

      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.suffixIcon,
      //Con l'istruzione seguente si garantisce che l'icona si adatti
      //al field interno allargandone però la view
      //  suffix: widget.suffixIcon,

      ///* Borders
      //Valore di default se i bordi sono null
      border: _buildBorder(context.colorScheme.primary),
      //Abilitato e con focus
      focusedBorder: _buildBorder(context.theme.focusColor),
      //Abilitato e senza errore
      enabledBorder: _buildBorder(context.colorScheme.primary),
      errorBorder: _buildBorder(
        widget.errorColor ?? context.colorScheme.error,
      ),
      disabledBorder: _buildBorder(
        CustomColors.grey.withOpacity(0.5),
      ),
    );
  }

  TextStyle _buildHintStyle() {
    return CustomTextStyle.textFieldLabelStyle.copyWith(
      color: CustomColors.grey,
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(CustomDimensions.textFieldRadius),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
