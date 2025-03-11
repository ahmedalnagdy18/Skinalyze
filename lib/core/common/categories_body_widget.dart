import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/fonts/app_text.dart';

class CategoriesBodyWidget extends StatelessWidget {
  const CategoriesBodyWidget(
      {super.key, required this.appbarTitle, required this.widget});
  final String appbarTitle;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: AppColors.yellowColor,
                      size: 22.r,
                    ),
                  ),
                  Text(
                    appbarTitle,
                    style: AppTexts.smallHeading.copyWith(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  SizedBox(),
                ],
              ),
            ),
            SizedBox(height: 22.h),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(22.r),
                      topLeft: Radius.circular(22.r),
                    )),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),
                  child: SingleChildScrollView(
                    child: widget,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
