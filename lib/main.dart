import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinalyze/core/shared_prefrances/shared_prefrances.dart';
import 'package:skinalyze/features/authentication/presentation/screens/authentication_page.dart';
import 'package:skinalyze/features/home/presentation/cubits/localization_cubit/local_cubit.dart';
import 'package:skinalyze/features/home/presentation/cubits/localization_cubit/local_state.dart';
import 'package:skinalyze/features/home/presentation/cubits/theme_cubit/theme_cubit.dart';
import 'package:skinalyze/features/home/presentation/cubits/theme_cubit/theme_state.dart';
import 'package:skinalyze/features/home/presentation/screens/main_app_page.dart';
import 'package:skinalyze/features/onboarding/screens/onboarding_page.dart';
import 'package:skinalyze/generated/l10n.dart';
import 'package:skinalyze/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown, // to prevent the landscape view
  ]);
  try {
    if (kIsWeb || Platform.isAndroid) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyCkav1SH5T1LBw4Xpv5ZQc0vweViwUgJx8",
          appId: "1:774689225494:android:60b91c6420eb1093e4ae37",
          messagingSenderId: "774689225494",
          projectId: "skinalyze-1bd8a",
          storageBucket: "skinalyze-1bd8a.firebasestorage.app",
        ),
      );
    } else {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyD7X2raVSCIuvWWFSlmx1z1o1NRzmcw7Fc",
          appId: "1:774689225494:ios:3054386b9ca8f3b2e4ae37",
          messagingSenderId: "774689225494",
          projectId: "skinalyze-1bd8a",
          storageBucket: "skinalyze-1bd8a.firebasestorage.app",
        ),
      );
    }
  } catch (e) {
    print("🔥 Firebase initialization error: $e");
  }
  await SharedPrefrance.instanc.initialization();

  bool hasSeenOnboarding = SharedPrefrance.instanc.isOnboardingShown();
  bool token = SharedPrefrance.instanc.getToken();
  await init();
  runApp(MyApp(
    hasSeenOnboarding: hasSeenOnboarding,
    token: token,
  ));
}

class MyApp extends StatelessWidget {
  final bool hasSeenOnboarding;
  final bool token;
  const MyApp(
      {super.key, required this.hasSeenOnboarding, required this.token});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return ScreenUtilInit(
        designSize: Size(393, 831),
        minTextAdapt: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ThemeCubit(),
              ),
              BlocProvider(
                create: (context) => LocaleCubit()..getSavedLanguage(),
              ),
            ],
            child: BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, themeState) {
                return BlocBuilder<LocaleCubit, ChangeLocaleState>(
                  builder: (context, state) {
                    return MaterialApp(
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      locale: state.locale,
                      supportedLocales: S.delegate.supportedLocales,
                      theme: themeState.themeData,
                      debugShowCheckedModeBanner: false,
                      home: hasSeenOnboarding
                          ? (user != null && token == true)
                              ? MainAppPage()
                              : AuthenticationPage()
                          : const OnboardingPage(),
                    );
                  },
                );
              },
            ),
          );
        });
  }
}
