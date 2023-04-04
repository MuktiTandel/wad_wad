import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.borderRadius,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixWidget,
    this.hintText,
    this.errorText,
    required this.controller,
    Function(String val)? validator,
    Function(String val)? onchange,
    this.isObscure = false,
    this.focusBorderColor,
    this.cursorColor,
    this.prefixWidget,
    this.maxLine,
    this.autoFocus
  }) : _validator = validator,
        _onchange = onchange,
        super(key: key);

  final double? borderRadius;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final Widget? suffixWidget;
  final String? hintText;
  final String? errorText;
  final Function(String val)? _validator;
  final TextEditingController controller;
  final bool? isObscure;
  final Function(String val)? _onchange;
  final Color? focusBorderColor;
  final Color? cursorColor;
  final Widget? prefixWidget;
  final int? maxLine;
  final bool? autoFocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure ?? false,
      cursorColor: cursorColor ?? Colors.black,
      minLines: 1,
      autofocus: autoFocus ?? false,
      maxLines: maxLine ?? 10,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 15),
            borderSide: BorderSide.none
          ),
          fillColor: Colors.grey.withOpacity(0.1),
          filled: true,
          prefixIcon: prefixWidget,
          suffixIcon: suffixWidget,
          hintText: hintText,
          errorText: errorText
      ),
      validator: (val) => _validator!(val!),
      onChanged: (val) => _onchange!(val),
    );
  }
}