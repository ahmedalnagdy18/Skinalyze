import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/fonts/app_text.dart';
import 'package:skinalyze/features/authentication/presentation/widgets/logout_alert_dailog.dart';
import 'package:skinalyze/features/home/presentation/widgets/articles_body.dart';
import 'package:skinalyze/features/home/presentation/widgets/drawer_widget.dart';
import 'package:skinalyze/features/home/presentation/widgets/services_body.dart';
import 'package:skinalyze/generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: DrawerWidget(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: widget.onTap,
                      child: Icon(
                        Icons.menu,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30.r,
                          child: Image.asset(
                            "images/app_logo.png",
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "Skinalyze",
                          style: GoogleFonts.quicksand(
                            textStyle: AppTexts.meduimHeading.copyWith(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder: (context) => LogoutAlertDialog(),
                        );
                      },
                      child: Icon(
                        Icons.logout_outlined,
                        color: AppColors.yellowColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22.h),
              Text(
                S.of(context).yourAiSkinExp,
                style: AppTexts.largeHeading.copyWith(
                  color: Colors.white,
                  fontSize: 28.sp,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                S.of(context).yourSkinHealth,
                style: AppTexts.meduimBody.copyWith(
                  color: Colors.white30,
                ),
              ),
              SizedBox(height: 40.h),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Services
                          ServicesBody(),
                          // Articles
                          SizedBox(height: 32.h),
                          ArticlesBody(),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
