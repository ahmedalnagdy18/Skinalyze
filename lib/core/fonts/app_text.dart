import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTexts {
  AppTexts._();

// Heading
  static TextStyle largeHeading = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 32.sp,
  );

  static TextStyle meduimHeading = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 24.sp,
  );

  static TextStyle smallHeading = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 16.sp,
  );

// body

  static TextStyle regularBody = TextStyle(
    fontSize: 16.sp,
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );

  static TextStyle meduimBody = TextStyle(
    fontSize: 14.sp,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle smallBody = TextStyle(
    fontSize: 12.sp,
    color: Colors.black,
  );
}
