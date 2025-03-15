import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinalyze/features/home/presentation/cubtis/theme_cubit.dart';
import 'package:skinalyze/features/home/presentation/cubtis/theme_state.dart';
import 'package:skinalyze/features/onboarding/screens/onboarding_page.dart';
import 'package:skinalyze/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCkav1SH5T1LBw4Xpv5ZQc0vweViwUgJx8",
      appId: "1:774689225494:android:60b91c6420eb1093e4ae37",
      messagingSenderId: "774689225494",
      projectId: "skinalyze-1bd8a",
      storageBucket: "skinalyze-1bd8a.firebasestorage.app",
    ),
  );
  await init();
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
