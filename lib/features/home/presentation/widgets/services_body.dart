import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/extentions/app_extention.dart';
import 'package:skinalyze/core/fonts/app_text.dart';
import 'package:skinalyze/features/home/presentation/screens/aboutus_page.dart';
import 'package:skinalyze/features/home/presentation/screens/analysis_page.dart';
import 'package:skinalyze/features/home/presentation/screens/events_page.dart';
import 'package:skinalyze/features/home/presentation/screens/videos_page.dart';

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
    List<String> serviceTitles = ["Analysis", "videos", "Events", "About us"];

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
          "Services",
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
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => servicesPages[index],
                  )),
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
