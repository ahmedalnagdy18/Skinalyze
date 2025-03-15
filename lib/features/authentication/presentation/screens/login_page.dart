import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinalyze/core/colors/app_colors.dart';
import 'package:skinalyze/core/common/app_textfield.dart';
import 'package:skinalyze/core/common/buttons.dart';
import 'package:skinalyze/core/extentions/app_extention.dart';
import 'package:skinalyze/core/fonts/app_text.dart';
import 'package:skinalyze/features/authentication/domain/entity/login_input.dart';
import 'package:skinalyze/features/authentication/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:skinalyze/features/authentication/presentation/screens/sign_up_page.dart';
import 'package:skinalyze/features/home/presentation/screens/main_app_page.dart';
import 'package:skinalyze/injection_container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(loginUsecase: sl()),
      child: _LoginPage(),
    );
  }
}

class _LoginPage extends StatefulWidget {
  const _LoginPage();

  @override
  State<_LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<_LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool isObscuretext = true;
  bool _isButtonEnabled = false;
  bool onceClick = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginCubitState>(
      listener: (context, state) {
        if (state is SucsessLoginState) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const MainAppPage(),
            ),
            (Route<dynamic> route) => false,
          );
        }
        if (state is ErrorLoginState) {
          showErrorToastMessage(message: state.message);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
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
                          validator: (value) => EmailValidator.validate(value!)
                              ? null
                              : "Please enter a valid email address",
                          mycontroller: _emailController,
                          onChanged: (value) {
                            if (onceClick == true) {
                              setState(() {
                                _formKey.currentState!.validate();
                              });
                            }
                          },
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
                                  onceClick = true;
                                  if (_formKey.currentState!.validate()) {
                                    _loginButton(context);
                                  }
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
                              onTap: () => Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpPage())),
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
      },
    );
  }

  void _loginButton(BuildContext context) {
    BlocProvider.of<LoginCubit>(context).login(
        loginEntity: LoginInput(
      email: _emailController.text,
      password: _passwordController.text,
    ));
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
