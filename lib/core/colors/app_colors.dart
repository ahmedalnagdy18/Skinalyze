import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  //Base colors
  static Color primaryColor = const Color(0xff0E333C);
  static Color secondaryColor = const Color(0xffF6B8A9);
  static Color yellowColor = const Color(0xffFBE186);
  static Color lightBlueColor = const Color(0xffA0B3FF);

  // Dark Mode Colors
  static Color darkPrimaryColor = const Color(0xff1A1A2E);
  static Color darkSecondaryColor = const Color(0xffE94560);

  //Border colors
  static Color primaryBorder = const Color(0xFF489FD5);
  static Color secondaryBorder = const Color.fromARGB(255, 230, 229, 229);

  //button colors
  static Color greenButtonColor = const Color(0xFF8DB636);

  //Background colors
  static Color pageColor = const Color(0xFFFFFFFF);
  static Color pricingColor = const Color(0xFF0D0C0C);

  //text colors
  static Color hintTextColor = const Color(0xFFADAFB3);
  static Color errorColor = const Color(0xFFFF2E28);

  //Gradients
  static List<Color> imageColor = const [
    Color(0xffA5A5A5),
    Color(0xff247BC0),
  ];
}
