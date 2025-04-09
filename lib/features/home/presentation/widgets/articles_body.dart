import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/extentions/app_extention.dart';
import 'package:skinalyze/core/fonts/app_text.dart';
import 'package:skinalyze/features/home/presentation/screens/collegaes_articles_page.dart';
import 'package:skinalyze/features/home/presentation/screens/platforms_articles_page.dart';
import 'package:skinalyze/generated/l10n.dart';

class ArticlesBody extends StatelessWidget {
  const ArticlesBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> articalTitles = [
      S.of(context).colleges,
      S.of(context).platforms,
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
          S.of(context).articles,
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
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        articlesPages[index],
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(8.r),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 45,
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
