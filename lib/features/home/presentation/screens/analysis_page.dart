import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinalyze/core/common/buttons.dart';
import 'package:skinalyze/core/common/categories_body_widget.dart';
import 'package:skinalyze/core/extentions/app_extention.dart';
import 'package:skinalyze/core/fonts/app_text.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoriesBodyWidget(
      arrowIcon: true,
      appbarTitle: "Analysis",
      centreWidget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
        child: Column(
          children: [
            Text(
              "Upload your image to make Ai to analylize it",
              style: AppTexts.meduimHeading.copyWith(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 22.h),
          ],
        ),
      ),
      widget: Column(
        children: [
          SizedBox(height: appHight(context, 0.10)),
          SizedBox(
            width: 250.r,
            child: Image.asset("images/analysis.png"),
          ),
          Text(
            "Upload image here",
          ),
          SizedBox(height: 18.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: ColoredButtonWidget(
              text: "Upload",
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
