import 'package:flutter/material.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/common/categories_body_widget.dart';
import 'package:skinalyze/features/home/presentation/widgets/setting_body_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoriesBodyWidget(
      arrowIcon: false,
      appbarTitle: "Setting",
      widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SettingBodyWidget(
              icon: Icons.color_lens_outlined,
              title: "theme",
              subtitle: "changeColor",
              widget: Switch(
                value: false,
                //themeState.isDarkTheme
                activeColor: AppColors.primaryColor,
                inactiveThumbColor: AppColors.primaryColor,
                inactiveTrackColor: Colors.white,
                onChanged: (value) {
                  // context.read<ThemeCubit>().toggleTheme();
                },
              ),
            )
          ]),
    );
  }
}
