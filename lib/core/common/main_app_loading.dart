import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainAppLoading extends StatelessWidget {
  const MainAppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: deprecated_member_use
      color: Colors.black.withOpacity(0.7),
      alignment: Alignment.center,
      child: SizedBox(
        height: 80.h,
        width: 80.w,
        child: Image.asset(
          "images/main_app_loading.gif",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
