import 'package:bottom_navbar_with_indicator/bottom_navbar_with_indicator.dart';
import 'package:flutter/material.dart';
import 'package:skinalyze/core/colors/app_colors.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget(
      {super.key, required this.currentIndex, required this.onTap});
  final int currentIndex;
  final dynamic Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return CustomLineIndicatorBottomNavbar(
      unselectedIconSize: 20,
      selectedIconSize: 20,
      selectedColor: AppColors.secondaryColor,
      unSelectedColor: Colors.grey.shade500,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      enableLineIndicator: false,
      lineIndicatorWidth: 5,
      indicatorType: IndicatorType.top,
      customBottomBarItems: [
        CustomBottomBarItems(
          label: "Home",
          icon: Icons.home_max_outlined,
          isAssetsImage: false,
        ),
        CustomBottomBarItems(
          label: "setting",
          icon: Icons.settings,
          isAssetsImage: false,
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
