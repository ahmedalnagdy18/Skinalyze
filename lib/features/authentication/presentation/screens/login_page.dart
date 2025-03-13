import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/common/app_textfield.dart';
import 'package:skinalyze/core/common/buttons.dart';
import 'package:skinalyze/core/extentions/app_extention.dart';
import 'package:skinalyze/core/fonts/app_text.dart';
import 'package:skinalyze/features/authentication/presentation/screens/sign_up_page.dart';
import 'package:skinalyze/features/home/presentation/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool isObscuretext = true;
  bool _isButtonEnabled = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Form(
              onChanged: _isEnabled,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: appHight(context, 0.1),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40.r,
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
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 22.h),
                    Center(
                      child: Text(
                        "Login",
                        style: GoogleFonts.josefinSans(
                          textStyle: AppTexts.meduimHeading.copyWith(
                            color: AppColors.primaryColor,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 22.h),
                    SizedBox(height: 22.h),
                    Text(
                      "Email",
                      style: AppTexts.regularBody.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextFieldWidget(
                      hintText: "Emaill*",
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      ],
                      mycontroller: _emailController,
                    ),
                    SizedBox(height: 22.h),
                    Text(
                      "Password",
                      style: AppTexts.regularBody.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextFieldWidget(
                      mycontroller: _passwordController,
                      hintText: "Password*",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscuretext = !isObscuretext;
                          });
                        },
                        child: Icon(
                          size: 20.r,
                          color: AppColors.hintTextColor,
                          isObscuretext
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      obscureText: isObscuretext,
                    ),
                    SizedBox(height: 22.h),
                    ColoredButtonWidget(
                      minHeight: 48.h,
                      radius: 12.r,
                      onPressed: _isButtonEnabled
                          ? () {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            }
                          : null,
                      text: "Login",
                      buttonColor: _isButtonEnabled
                          ? AppColors.secondaryColor
                          : Colors.grey,
                    ),
                    SizedBox(height: 22.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: AppTexts.meduimBody.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const SignUpPage())),
                          child: Text(
                            " Sign up",
                            style: AppTexts.meduimBody.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  void _isEnabled() {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      _isButtonEnabled = true;
      setState(() {});
    } else {
      _isButtonEnabled = false;
    }
    setState(() {});
  }
}
