import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/common/buttons.dart';
import 'package:skinalyze/core/fonts/app_text.dart';
import 'package:skinalyze/features/authentication/presentation/screens/login_page.dart';
import 'package:skinalyze/features/authentication/presentation/screens/sign_up_page.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40.r,
                          child: Image.asset(
                            "images/app_logo.png",
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "Skinalyze",
                          style: GoogleFonts.quicksand(
                            textStyle: AppTexts.largeHeading.copyWith(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 22.h),
                    Text(
                      "Skinalyze uses AI to analyze your skin from a simple photo, providing instant insights and guidance for better skin health.",
                      style: AppTexts.meduimBody.copyWith(
                        color: Colors.white54,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              ColoredButtonWidget(
                minHeight: 48.h,
                radius: 12.r,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ));
                },
                text: "Sign up",
              ),
              SizedBox(height: 22.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: AppTexts.meduimBody.copyWith(
                      color: Colors.white54,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginPage())),
                    child: Text(
                      " Login",
                      style: AppTexts.meduimBody.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
