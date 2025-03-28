import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/fonts/app_text.dart';
import 'package:skinalyze/core/shared_prefrances/shared_prefrances.dart';
import 'package:skinalyze/features/authentication/presentation/screens/authentication_page.dart';
import 'package:skinalyze/features/onboarding/widgets/dots_widget.dart';
import 'package:skinalyze/features/onboarding/widgets/onboarding_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController pageController = PageController();
  int currentPage = 0;
  late List<Onboarding> onboardingList;

  @override
  void initState() {
    super.initState();
    onboardingList = createUserOnboardingList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 14.h),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 28.r,
                        child: Image.asset(
                          "images/app_logo.png",
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Skinalyze",
                        style: GoogleFonts.quicksand(
                          textStyle: AppTexts.smallHeading.copyWith(
                            color: AppColors.secondaryColor,
                            fontSize: 18.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                  currentPage == 2
                      ? SizedBox()
                      : InkWell(
                          onTap: () async {
                            await SharedPrefrance.instanc
                                .setOnboardingShown(true);
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AuthenticationPage(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: Text(
                            "Skip",
                            style: AppTexts.smallHeading.copyWith(
                              color: AppColors.yellowColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                ],
              ),
              SizedBox(height: 40.h),
              // onboarding body
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: onboardingList.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 600),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(
                                    1.0, 0.0), // Start off-screen (right)
                                end: Offset(0.0, 0.0), // End at the center
                              ).animate(animation),
                              child: child,
                            );
                          },
                          child: Text(
                            onboardingList[currentPage].title,
                            key: ValueKey<String>(
                                onboardingList[currentPage].title),
                            style: AppTexts.largeHeading.copyWith(
                              color: Colors.white,
                              fontSize: 28.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 32.h),
                        SizedBox(
                            width: MediaQuery.of(context).orientation ==
                                    Orientation.portrait
                                ? 300.r
                                : MediaQuery.of(context).size.width * 0.1,
                            child: Image.asset(onboardingList[index].image)),
                      ],
                    );
                  },
                ),
              ),

              // next button
              SizedBox(height: 32.h),
              Padding(
                padding: EdgeInsets.only(bottom: 50.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DotsWidget(
                      dotsCount: onboardingList.length,
                      position: currentPage.toDouble(),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      overlayColor: const WidgetStatePropertyAll(
                        Colors.transparent,
                      ),
                      onTap: () async {
                        if (currentPage < onboardingList.length - 1) {
                          pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                        if (currentPage == 2) {
                          await SharedPrefrance.instanc
                              .setOnboardingShown(true);
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const AuthenticationPage(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        }
                      },
                      child: Container(
                        constraints: BoxConstraints(
                          minHeight: 100.r,
                          minWidth: 100.r,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.secondaryColor,
                        ),
                        child: Center(
                          child: Text(
                            currentPage == 2 ? "Get start" : "Next",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
