import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/extentions/app_extention.dart';
import 'package:skinalyze/core/fonts/app_text.dart';
import 'package:skinalyze/features/home/presentation/screens/aboutus_page.dart';
import 'package:skinalyze/features/home/presentation/screens/analysis_page.dart';
import 'package:skinalyze/features/home/presentation/screens/events_page.dart';
import 'package:skinalyze/features/home/presentation/screens/videos_page.dart';
import 'package:skinalyze/generated/l10n.dart';

class ServicesBody extends StatelessWidget {
  const ServicesBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> serviceImages = [
      "images/analysis.png",
      "images/online_page.png",
      "images/events.png",
      "images/aboutus.png"
    ];
    List<String> serviceTitles = [
      S.of(context).analysis,
      S.of(context).videos,
      S.of(context).events,
      S.of(context).aboutUs,
    ];

    List servicesPages = [
      AnalysisPage(),
      VideosPage(),
      EventsPage(),
      AboutusPage(),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).services,
          style: AppTexts.smallHeading.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(height: 12.h),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (MediaQuery.of(context).size.width > 600) ? 3 : 2,
            crossAxisSpacing: appWidth(context, 0.02),
            mainAxisSpacing: appHight(context, 0.02),
            childAspectRatio: 2,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        servicesPages[index],
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
                  children: [
                    Image.asset(serviceImages[index]),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        serviceTitles[index],
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
