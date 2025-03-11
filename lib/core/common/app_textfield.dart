import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/fonts/app_text.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? mycontroller;
  final String? Function(String?)? validator;
  final int? maxLines;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? errorStyle;
  final int? maxLength;
  final double? raduisSize;
  final String? counterText;
  final FocusNode? focusNode;
  final bool? autofocus;
  final bool? readOnly;
  final Color? hintTextColor;

  const TextFieldWidget({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.obscureText,
    this.mycontroller,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
    this.maxLines,
    this.onChanged,
    this.inputFormatters,
    this.errorStyle,
    this.maxLength,
    this.raduisSize,
    this.counterText,
    this.focusNode,
    this.autofocus,
    this.readOnly,
    this.hintTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableSuggestions: false,
      readOnly: readOnly ?? false,
      autofocus: autofocus ?? false,
      focusNode: focusNode,
      style: AppTexts.regularBody,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      controller: mycontroller,
      validator: validator,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        counterText: counterText,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(raduisSize ?? 16).r,
          borderSide: BorderSide(
            color: AppColors.errorColor,
          ),
        ),
        errorStyle: errorStyle,
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.errorColor,
            ),
            borderRadius: BorderRadius.circular(16).r),
        errorMaxLines: 2,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(raduisSize ?? 16).r,
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(raduisSize ?? 16).r,
          borderSide: BorderSide(
            color: AppColors.secondaryBorder,
            //todo: fix this
          ),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: hintTextColor ?? AppColors.hintTextColor,
        ),
      ),
    );
  }
}
