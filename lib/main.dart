import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinalyze/features/home/presentation/cubtis/theme_cubit.dart';
import 'package:skinalyze/features/home/presentation/cubtis/theme_state.dart';
import 'package:skinalyze/features/onboarding/screens/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(393, 831),
        minTextAdapt: true,
        builder: (context, child) {
          return BlocProvider(
            create: (context) => ThemeCubit(),
            child: BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, themeState) {
                return MaterialApp(
                  theme: themeState.themeData,
                  debugShowCheckedModeBanner: false,
                  home: const OnboardingPage(),
                );
              },
            ),
          );
        });
  }
}
