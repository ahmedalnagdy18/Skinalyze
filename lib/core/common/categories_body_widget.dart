import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/fonts/app_text.dart';

class CategoriesBodyWidget extends StatelessWidget {
  const CategoriesBodyWidget(
      {super.key,
      required this.appbarTitle,
      required this.widget,
      this.centreWidget,
      required this.arrowIcon});
  final String appbarTitle;
  final Widget widget;
  final Widget? centreWidget;
  final bool arrowIcon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                  arrowIcon == true
                      ? InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: AppColors.yellowColor,
                            size: 22.r,
                          ),
                        )
                      : SizedBox(),
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
            centreWidget ?? SizedBox(),
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
                    physics: BouncingScrollPhysics(),
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
