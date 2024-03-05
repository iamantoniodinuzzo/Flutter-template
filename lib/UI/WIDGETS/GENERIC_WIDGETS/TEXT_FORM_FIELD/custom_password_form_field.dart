
import 'package:flutter/material.dart';
import 'package:flutter_template_mobile/COMMON/THEME/custom_colors.dart';
import 'package:flutter_template_mobile/UI/WIDGETS/GENERIC_WIDGETS/TEXT_FORM_FIELD/custom_text_form_field.dart';

class CustomPasswordFormField extends StatefulWidget {
  final TextEditingController passwordController;
  final String hintText;
  final String? errorText;
  final Color? errorColor;
  final Function(String)? onChanged;

  const CustomPasswordFormField({
    super.key,
    required this.passwordController,
    required this.hintText,
    this.errorText,
    this.errorColor,
    this.onChanged,
  });

  @override
  State<CustomPasswordFormField> createState() =>
      _CustomPasswordFormFieldState();
}

class _CustomPasswordFormFieldState extends State<CustomPasswordFormField> {
  //Utilizzata per nascondere o mostrare la password
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      errorText: widget.errorText,
      errorColor: widget.errorColor,
      controller: widget.passwordController,
      isObscureText: _isHidden,
      keyboardType: TextInputType.text,
      hintText: widget.hintText,
      onChanged: widget.onChanged,
      suffixIcon: IconButton(
        onPressed: _togglePasswordView,
        icon: _isHidden
            ? const Icon(
                Icons.visibility,
                color: CustomColors.grey,
              )
            : const Icon(
                Icons.visibility_off,
                color: CustomColors.grey,
              ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
