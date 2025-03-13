import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/common/categories_body_widget.dart';
import 'package:skinalyze/core/fonts/app_text.dart';

class AboutusPage extends StatelessWidget {
  const AboutusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoriesBodyWidget(
      arrowIcon: true,
      appbarTitle: "About us",
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
            """Welcome to Skinalyze, your AI-powered skin health assistant.  
Our advanced AI technology helps you analyze skin conditions with just a simple photo.  
Get instant insights and recommendations to take better care of your skin.  

✔ Snap a photo and let AI analyze your skin.  
✔ Learn skincare tips tailored to your needs.  
✔ Supports both **Arabic** and **English** for a better user experience.  
✔ Enjoy a sleek **Dark Mode** for comfortable use at night.  
✔ Stay updated with the latest dermatology research and AI advancements.  

While our AI provides helpful guidance, always consult a dermatologist for medical advice.  
Explore our app and take the first step toward healthier skin today!""",
            style: AppTexts.regularBody,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
