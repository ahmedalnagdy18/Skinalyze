import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/common/categories_body_widget.dart';
import 'package:skinalyze/features/home/presentation/cubits/theme_cubit/theme_cubit.dart';
import 'package:skinalyze/features/home/presentation/cubits/theme_cubit/theme_state.dart';
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
            ),
            SizedBox(height: 14.h),
            SettingBodyWidget(
              icon: Icons.language,
              title: "Language",
              subtitle: "Change app language",
              widget: DropdownButton<String>(
                underline: Container(
                  height: 1.h,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                dropdownColor: Colors.grey.shade200,
                value: "en",
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                items: ['ar', 'en'].map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    //enabled: item != state.locale.languageCode,
                    child: Text(
                      "En",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // if (newValue != null &&
                  //     newValue != state.locale.languageCode) {
                  //   context.read<LocaleCubit>().changeLanguage(newValue);
                  // }
                },
              ),
              onTap: () {},
            ),
          ]),
    );
  }
}
