import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingBodyWidget extends StatelessWidget {
  const SettingBodyWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.widget,
    this.onTap,
  });
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget widget;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: Colors.grey),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              width: 40.r,
              height: 40.r,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x050b1a51),
              ),
              child: Icon(
                icon,
                color: Theme.of(context).scaffoldBackgroundColor,
                size: 24.r,
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const Spacer(),
            widget,
          ],
        ),
      ),
    );
  }
}
