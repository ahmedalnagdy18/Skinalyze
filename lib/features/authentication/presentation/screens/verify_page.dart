import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinalyze/core/common/buttons.dart';
import 'package:skinalyze/core/fonts/app_text.dart';
import 'package:skinalyze/features/authentication/presentation/screens/login_page.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120.r,
                    child: Image.asset(
                      "images/email_verify.png",
                    ),
                  ),
                  SizedBox(width: 4.w),
                ],
              ),
              SizedBox(height: 22.h),
              Text(
                "Please verify your email adress",
                style: AppTexts.meduimBody.copyWith(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 22.h),
              ColoredButtonWidget(
                minHeight: 48.h,
                radius: 12.r,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
                text: "Ok",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
