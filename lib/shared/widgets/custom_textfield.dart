// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_formfield/my_formfield.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.inputAction,
    this.obscureText,
    this.suffixIcon,
    this.validator,
    this.hint,
    this.label,
    this.labelStyle,
    this.fillColor,
  });
  final String? label;
  final String? hint;
  final Color? fillColor;
  final TextStyle? labelStyle;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputAction? inputAction;
  final bool? obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label ?? 'Label', style: labelStyle),
        const SizedBox(height: 8.0),
        MyFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText ?? false,
          inputAction: inputAction,
          inputFilled: true,
          inputFillColor: fillColor ?? Colors.transparent,
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          inputHint: hint,
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
