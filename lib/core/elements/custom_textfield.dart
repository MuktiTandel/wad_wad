import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wad_wad/core/const/app_colors.dart';
import 'package:wad_wad/core/const/app_const.dart';
import 'package:wad_wad/core/elements/custom_text.dart';

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
    this.autoFocus,
    required this.onTap,
    this.labelPadding
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
  final VoidCallback onTap;
  final EdgeInsets? labelPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure ?? false,
      cursorColor: cursorColor ?? Colors.blue,
      minLines: 1,
      onTap: (){
        onTap();
      },
      autofocus: autoFocus ?? false,
      maxLines: maxLine ?? 10,
      textAlignVertical: TextAlignVertical.bottom,
      style:  const TextStyle(
        fontFamily: "Poppins",
      ),
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
          errorText: errorText,
          label: Padding(
            padding: labelPadding ??  EdgeInsets.only(top: 30.h),
            child: CustomText(
              text: hintText ?? "",
              color: AppColors.gray,
            ),
          ),
          hintStyle: const TextStyle(
            color: AppColors.gray,
          )
      ),
      validator: (val) => _validator!(val!),
      onChanged: (val) => _onchange!(val) ?? (val){},
    );
  }
}