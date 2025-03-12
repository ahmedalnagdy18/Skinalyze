import 'package:flutter/material.dart';

class Onboarding {
  final String image;
  final String title;

  Onboarding({required this.image, required this.title});
}

List<Onboarding> createUserOnboardingList(BuildContext context) {
  return [
    Onboarding(
      image: "images/onboarding.gif",
      title: "Scan your skin with AI-powered analysis.",
    ),
    Onboarding(
      image: "images/onboarding2.gif",
      title: "Get instant insights and early detection.",
    ),
    Onboarding(
      image: "images/onboarding3.gif",
      title: "Take control of your skin health today.",
    ),
  ];
}
