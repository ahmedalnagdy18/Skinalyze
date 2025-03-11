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
      title: "The first onboarding title",
    ),
    Onboarding(
      image: "images/onboarding2.gif",
      title: "The second onboarding title",
    ),
    Onboarding(
      image: "images/onboarding3.gif",
      title: "The third onboarding title",
    ),
  ];
}
