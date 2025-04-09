import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/common/buttons.dart';
import 'package:skinalyze/core/fonts/app_text.dart';
import 'package:skinalyze/core/shared_prefrances/shared_prefrances.dart';
import 'package:skinalyze/features/authentication/presentation/screens/authentication_page.dart';
import 'package:skinalyze/generated/l10n.dart';

class LogoutAlertDialog extends StatelessWidget {
  const LogoutAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12).r),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 30.r,
                child: Image.asset(
                  "images/app_logo.png",
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                "Skinalyze",
                style: GoogleFonts.quicksand(
                  textStyle: AppTexts.meduimHeading.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            S.of(context).logout,
            style: AppTexts.regularBody.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            S.of(context).areYouSure,
            style: AppTexts.regularBody.copyWith(
              fontSize: 14.sp,
              color: Colors.white60,
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                child: ColoredButtonWidget(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signOut();
                      await SharedPrefrance.instanc
                          .removeFromShared(key: 'token');
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const AuthenticationPage(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Logout failed: ${e.toString()}"),
                        ),
                      );
                    }
                  },
                  text: S.of(context).yes,
                  textColor: Colors.white,
                  minHeight: 45.h,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: ColoredButtonWidget(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: S.of(context).no,
                  textColor: Colors.white,
                  minHeight: 45.h,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
