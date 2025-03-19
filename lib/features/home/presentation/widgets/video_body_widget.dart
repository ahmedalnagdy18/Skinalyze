import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/common/buttons.dart';
import 'package:skinalyze/core/extentions/app_extention.dart';
import 'package:skinalyze/core/fonts/app_text.dart';
import 'package:skinalyze/features/home/domain/entity/video_item_entity.dart';

class VideoBodyWidget extends StatelessWidget {
  const VideoBodyWidget({super.key, required this.index, required this.video});
  final int index;
  final VideoItem video;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.r),
          ),
          padding: EdgeInsets.all(8.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Video Icon
              Expanded(
                child: Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.video_collection_sharp,
                    color: AppColors.secondaryColor,
                    size: 40.r,
                  ),
                ),
              ),
              SizedBox(width: 12.w),

              // Title & Button Section
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      video.title,
                      style: AppTexts.smallHeading.copyWith(fontSize: 16.sp),
                    ),
                    Text(
                      "Lesson ${index + 1} - ${video.description}",
                      style: AppTexts.meduimBody.copyWith(
                        color: Colors.grey,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      width: double.infinity,
                      child: ColoredButtonWidget(
                        text: "Watch",
                        onPressed: () {
                          launchURL(video.link);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
