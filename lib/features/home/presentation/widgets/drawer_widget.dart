import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/fonts/app_text.dart';
import 'package:skinalyze/features/authentication/presentation/widgets/logout_alert_dailog.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    return Drawer(
      backgroundColor: Colors.grey.shade200,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration:
                BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 35,
                      child: Image.asset(
                        "images/app_logo.png",
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      "Skinalyze",
                      style: GoogleFonts.quicksand(
                        textStyle: AppTexts.largeHeading.copyWith(
                          color: AppColors.secondaryColor,
                          fontSize: 26,
                        ),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 22.r,
                    ),
                    SizedBox(width: 6.w),
                    Expanded(
                      child: Text(
                        user?.displayName ?? "No Email Found",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTexts.meduimBody.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 22.h),
              ],
            ),
          ),
          _ListTileWidget(
            icon: Icons.home,
            data: 'Home',
            onTap: () => Navigator.pop(context),
          ),
          _ListTileWidget(
            icon: Icons.logout,
            data: 'Logout',
            onTap: () async {
              showDialog(
                context: context,
                builder: (context) => LogoutAlertDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ListTileWidget extends StatelessWidget {
  const _ListTileWidget({
    required this.icon,
    required this.data,
    required this.onTap,
  });
  final IconData icon;
  final String data;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).scaffoldBackgroundColor,
        size: 24.r,
      ),
      title: Text(
        data,
        style: AppTexts.meduimBody,
      ),
      onTap: onTap,
    );
  }
}
