import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/common/buttons.dart';
import 'package:skinalyze/core/extentions/app_extention.dart';
import 'package:skinalyze/core/fonts/app_text.dart';
import 'package:skinalyze/core/common/categories_body_widget.dart';

class CollegaesArticlesPage extends StatefulWidget {
  const CollegaesArticlesPage({super.key});

  @override
  State<CollegaesArticlesPage> createState() => _CollegaesArticlesPageState();
}

class _CollegaesArticlesPageState extends State<CollegaesArticlesPage> {
  List<String> title = ["Cambridge", "Oxford", "Stanford", "MIT"];
  List<String> subTitle = [
    "AI can map and influence human desires.",
    "Oxford partners with tech leaders for AI research.",
    "US leads AI innovation, surpassing China.",
    "Exploring the philosophy of artificial intelligence.",
  ];
  List<String> links = [
    "https://www.thetimes.com/uk/science/article/ai-could-map-and-manipulate-our-desires-say-cambridge-researchers-xzl360gbn?utm_source",
    "https://www.ft.com/content/f949c646-88a3-4c65-9257-98fd6aea0e7b?utm_source",
    "https://apnews.com/article/ai-us-china-competition-stanford-index-uk-india-c8eb9be0253eb39776c3e38d05f1a329",
    "https://en.wikipedia.org/wiki/Philosophy_of_artificial_intelligence?utm_source"
  ];
  @override
  Widget build(BuildContext context) {
    return CategoriesBodyWidget(
      appbarTitle: "Colleges Articles",
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
                        height: 70.r,
                        child: Image.asset("images/international.png")),
                    SizedBox(width: 8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title[i],
                          style: AppTexts.smallHeading.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
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
