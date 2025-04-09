import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/common/categories_body_widget.dart';
import 'package:skinalyze/core/fonts/app_text.dart';
import 'package:skinalyze/generated/l10n.dart';

class AboutusPage extends StatelessWidget {
  const AboutusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoriesBodyWidget(
      arrowIcon: true,
      appbarTitle: S.of(context).aboutUs,
      widget: Column(
        children: [
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 35.r,
                child: Image.asset(
                  "images/app_logo.png",
                ),
              ),
              SizedBox(width: 4.w),
              //Emblema
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
          SizedBox(height: 32.h),
          Text(
            S.of(context).aboutUsDescrb,
            style: AppTexts.regularBody,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
