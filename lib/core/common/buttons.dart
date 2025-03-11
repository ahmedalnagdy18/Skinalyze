import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinalyze/core/colors/app_colors.dart';

class ColoredButtonWidget extends StatelessWidget {
  const ColoredButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonColor,
    this.textColor,
    this.icon,
    this.minWidth,
    this.minHeight,
  });
  final String text;
  final void Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final Widget? icon;
  final double? minWidth;
  final double? minHeight;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      highlightColor: Colors.transparent,
      highlightElevation: 0,
      splashColor: Colors.transparent,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
      padding: const EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Container(
          constraints: BoxConstraints(
              minHeight: minHeight ?? 46.h, minWidth: minWidth ?? 0),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon ?? const SizedBox(),
              icon != null ? SizedBox(width: 6.w) : const SizedBox(),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColor ?? AppColors.primaryColor,
                    fontSize: 14.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
