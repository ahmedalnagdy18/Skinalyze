import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher_string.dart';

double appHight(BuildContext context, double h) {
  return MediaQuery.of(context).size.height * h;
}

double appWidth(BuildContext context, double w) {
  return MediaQuery.of(context).size.width * w;
}
//  appHight(context, 1)   to add hight by mediaQuere

void launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}

// Navigator.of(context).pushAndRemoveUntil(
//          MaterialPageRoute(
//            builder: (context) => const TimelinePage(),),
//              (Route<dynamic> route) => false, );

void showToastMessage({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.green,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    textColor: Colors.black,
    fontSize: 14.0.sp,
  );
}
// showToastMessage(message: "Added successfully");   to call it

void showErrorToastMessage({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.red,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 2,
    textColor: Colors.white,
    fontSize: 14.0.sp,
  );
}
