import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinalyze/core/common/categories_body_widget.dart';
import 'package:skinalyze/core/fonts/app_text.dart';
import 'package:skinalyze/features/home/domain/entity/video_item_entity.dart';
import 'package:skinalyze/features/home/presentation/widgets/video_body_widget.dart';
import 'package:skinalyze/generated/l10n.dart';

class VideosPage extends StatelessWidget {
  const VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final videoList = getVideoList(context);
    return CategoriesBodyWidget(
      arrowIcon: true,
      appbarTitle: S.of(context).videos,
      centreWidget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
        child: Column(
          children: [
            Text(
              S.of(context).videosPageTitle,
              style: AppTexts.meduimHeading.copyWith(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 22.h),
          ],
        ),
      ),
      widget: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final video = videoList[index];
          return VideoBodyWidget(
            index: index,
            video: video,
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 12.h),
        itemCount: videoList.length,
      ),
    );
  }
}
