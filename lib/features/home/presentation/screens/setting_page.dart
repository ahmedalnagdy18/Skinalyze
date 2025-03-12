import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/common/categories_body_widget.dart';
import 'package:skinalyze/features/home/presentation/cubtis/theme_cubit.dart';
import 'package:skinalyze/features/home/presentation/cubtis/theme_state.dart';
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
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, themeState) {
                return SettingBodyWidget(
                  icon: Icons.color_lens_outlined,
                  title: "Theme",
                  subtitle: "Change Color",
                  widget: Switch(
                    value: themeState.isDarkTheme,
                    activeColor: AppColors.darkPrimaryColor,
                    inactiveThumbColor: AppColors.primaryColor,
                    inactiveTrackColor: Colors.white,
                    onChanged: (value) {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                  ),
                );
              },
            )
          ]),
    );
  }
}
