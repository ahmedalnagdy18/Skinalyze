import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinalyze/core/common/categories_body_widget.dart';
import 'package:skinalyze/core/fonts/app_text.dart';
import 'package:skinalyze/generated/l10n.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoriesBodyWidget(
        arrowIcon: true,
        appbarTitle: S.of(context).events,
        centreWidget: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
          child: Column(
            children: [
              Text(
                S.of(context).eventsPageTitle,
                style: AppTexts.meduimHeading.copyWith(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 22.h),
            ],
          ),
        ),
        widget: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(S.of(context).areYouMember,
                          textAlign: TextAlign.start,
                          style: AppTexts.smallHeading.copyWith(
                            fontSize: 18.sp,
                          )),
                      Text(
                        S.of(context).joinUsTo,
                        textAlign: TextAlign.start,
                        style: AppTexts.smallBody,
                      ),
                      SizedBox(height: 12.h),
                      MaterialButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r)),
                        padding: const EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(30.0.r)),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: 100.w,
                              minHeight: 45.h,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              S.of(context).join,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 150.h,
                  child: Image.asset(
                    'images/events.png',
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
