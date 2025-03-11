import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/extentions/app_extention.dart';
import 'package:skinalyze/core/fonts/app_text.dart';
import 'package:skinalyze/features/home/presentation/screens/collegaes_articles_page.dart';
import 'package:skinalyze/features/home/presentation/screens/platforms_articles_page.dart';

class ArticlesBody extends StatelessWidget {
  const ArticlesBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> articalTitles = [
      "Colleges",
      "Platforms",
    ];
    List<String> articalImages = [
      "images/international.png",
      "images/artical.png",
    ];
    List articlesPages = [
      CollegaesArticlesPage(),
      PlatformsArticlesPage(),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Articles",
          style: AppTexts.smallHeading.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(height: 12.h),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: appWidth(context, 0.02),
            childAspectRatio: 2,
          ),
          itemCount: 2,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => articlesPages[index],
                  )),
              child: Container(
                padding: EdgeInsets.all(8.r),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Row(
                  children: [
                    SizedBox(
                      height: 80,
                      child: Image.asset(
                        articalImages[index],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        articalTitles[index],
                        style: AppTexts.meduimBody,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
