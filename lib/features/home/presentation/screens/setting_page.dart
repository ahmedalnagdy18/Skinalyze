import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/common/categories_body_widget.dart';
import 'package:skinalyze/features/home/presentation/cubits/localization_cubit/local_cubit.dart';
import 'package:skinalyze/features/home/presentation/cubits/localization_cubit/local_state.dart';
import 'package:skinalyze/features/home/presentation/cubits/theme_cubit/theme_cubit.dart';
import 'package:skinalyze/features/home/presentation/cubits/theme_cubit/theme_state.dart';
import 'package:skinalyze/features/home/presentation/widgets/setting_body_widget.dart';
import 'package:skinalyze/generated/l10n.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoriesBodyWidget(
      arrowIcon: false,
      appbarTitle: S.of(context).setting,
      widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, themeState) {
                return SettingBodyWidget(
                  icon: Icons.color_lens_outlined,
                  title: S.of(context).theme,
                  subtitle: S.of(context).changeColor,
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
            BlocConsumer<LocaleCubit, ChangeLocaleState>(
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      S.of(context).langSnakBar,
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.grey.shade800,
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              builder: (context, state) {
                return SettingBodyWidget(
                  widget: DropdownButton<String>(
                    underline: Container(
                      height: 1.h,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    dropdownColor: Colors.grey,
                    value: state.locale.languageCode,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    items: ['ar', 'en'].map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        enabled: item != state.locale.languageCode,
                        child: Text(
                          item == 'ar'
                              ? S.of(context).dropdown1
                              : S.of(context).dropdown2,
                          style: TextStyle(
                            color: item == state.locale.languageCode
                                ? Colors.black45
                                : Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null &&
                          newValue != state.locale.languageCode) {
                        context.read<LocaleCubit>().changeLanguage(newValue);
                      }
                    },
                  ),
                  icon: Icons.language_outlined,
                  title: S.of(context).language,
                  subtitle: S.of(context).changeAppLang,
                );
              },
            ),
          ]),
    );
  }
}
