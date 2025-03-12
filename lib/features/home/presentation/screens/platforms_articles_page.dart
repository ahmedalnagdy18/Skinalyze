import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/common/buttons.dart';
import 'package:skinalyze/core/extentions/app_extention.dart';
import 'package:skinalyze/core/fonts/app_text.dart';
import 'package:skinalyze/core/common/categories_body_widget.dart';

class PlatformsArticlesPage extends StatefulWidget {
  const PlatformsArticlesPage({super.key});

  @override
  State<PlatformsArticlesPage> createState() => _CollegaesArticlesPageState();
}

class _CollegaesArticlesPageState extends State<PlatformsArticlesPage> {
  List<String> title = [
    "The New York Times",
    "CNN",
    "The Guardian",
    "Wikipedia"
  ];
  List<String> subTitle = [
    "How AI is reshaping the future of healthcare.",
    "The role of AI in modern medical advancements.",
    "AI-powered diagnostics: A revolution in medicine.",
    "Comprehensive insights on AI in healthcare.",
  ];
  List<String> links = [
    "https://www.nytimes.com/",
    "https://edition.cnn.com/",
    "https://www.theguardian.com/international",
    "https://en.wikipedia.org/wiki/Artificial_intelligence_in_healthcare",
  ];

  @override
  Widget build(BuildContext context) {
    return CategoriesBodyWidget(
      arrowIcon: true,
      appbarTitle: "Platforms Articles",
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 12.h),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: title.length,
            itemBuilder: (context, i) {
              return Container(
                padding: EdgeInsets.all(8.r),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r)),
                child: Row(
                  children: [
                    SizedBox(
                        height: 70.r, child: Image.asset("images/artical.png")),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: appWidth(context, 0.40),
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            title[i],
                            style: AppTexts.smallHeading.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        SizedBox(
                          width: appWidth(context, 0.40),
                          child: Text(
                            subTitle[i],
                            overflow: TextOverflow.ellipsis,
                            style: AppTexts.smallBody.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    ColoredButtonWidget(
                      icon: Icon(
                        Icons.arrow_outward,
                        size: 18,
                        color: AppColors.primaryColor,
                      ),
                      minWidth: 80.w,
                      minHeight: 30.h,
                      text: "View",
                      onPressed: () {
                        launchURL(links[i]);
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
