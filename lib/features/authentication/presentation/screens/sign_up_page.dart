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
import 'package:skinalyze/features/authentication/domain/entity/sign_up_input.dart';
import 'package:skinalyze/features/authentication/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:skinalyze/features/authentication/presentation/screens/login_page.dart';
import 'package:skinalyze/features/home/presentation/screens/main_app_page.dart';
import 'package:skinalyze/injection_container.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(signUpUsecase: sl()),
      child: _SignUpPage(),
    );
  }
}

class _SignUpPage extends StatefulWidget {
  const _SignUpPage();

  @override
  State<_SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<_SignUpPage> {
  bool _hasError = false;
  final _formKey = GlobalKey<FormState>();
  bool isObscuretext = true;
  bool _isButtonEnabled = false;
  bool onceClick = false;
  bool errorPassword = false;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SucsessSignupState) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const MainAppPage(),
            ),
            (Route<dynamic> route) => false,
          );
        }
        if (state is ErrorSignupState) {
          showErrorToastMessage(message: "Error");
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
                          "Create account",
                          style: GoogleFonts.josefinSans(
                            textStyle: AppTexts.meduimHeading.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 22.h),
                      Text(
                        "Name",
                        style: AppTexts.regularBody.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Expanded(
                            child: TextFieldWidget(
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^[a-zA-Zا-ي]*$'),
                                )
                              ],
                              maxLength: 15,
                              counterText: '',
                              mycontroller: _firstNameController,
                              hintText: "First name*",
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  setState(() {
                                    _hasError = true;
                                  });
                                  return "First name must be at least 3 characters";
                                }
                                setState(() {
                                  _hasError = false;
                                });
                                return null;
                              },
                              onChanged: (value) {
                                if (onceClick == true) {
                                  setState(() {
                                    _formKey.currentState!.validate();
                                  });
                                }
                              },
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: TextFieldWidget(
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'^[a-zA-Zا-ي]*$'),
                                )
                              ],
                              maxLength: 15,
                              counterText: '',
                              hintText: "Last name*",
                              mycontroller: _lastNameController,
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 3) {
                                  setState(() {
                                    _hasError = true;
                                  });
                                  return "Last name must be at least 3 characters";
                                }
                                setState(() {
                                  _hasError = false;
                                });
                                return null;
                              },
                              onChanged: (value) {
                                if (onceClick == true) {
                                  setState(() {
                                    _formKey.currentState!.validate();
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
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
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],
                        mycontroller: _emailController,
                        validator: (value) => EmailValidator.validate(value!)
                            ? null
                            : "Please enter a valid email address",
                        hintText: "Email*",
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
                        onChanged: (value) {
                          if (onceClick == true) {
                            setState(() {
                              _formKey.currentState!.validate();
                            });
                          }
                        },
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8 ||
                              !regex.hasMatch(value)) {
                            setState(() {
                              _hasError = true;
                              errorPassword = true;
                            });
                            return "";
                          }
                          setState(() {
                            _hasError = false;
                            errorPassword = false;
                          });
                          return null;
                        },
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
                            color: _hasError
                                ? AppColors.errorColor
                                : AppColors.hintTextColor,
                            _hasError
                                ? Icons.warning_amber_outlined
                                : isObscuretext
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                          ),
                        ),
                        obscureText: isObscuretext,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Password must contain at least 8 characters, including one uppercase letter, one number, and one special character.",
                        style: AppTexts.smallBody.copyWith(
                          color: errorPassword == false
                              ? AppColors.primaryColor
                              : Colors.red,
                        ),
                      ),
                      SizedBox(height: 22.h),
                      ColoredButtonWidget(
                        minHeight: 48.h,
                        radius: 12.r,
                        onPressed: _isButtonEnabled
                            ? () {
                                onceClick = true;
                                if (_formKey.currentState!.validate()) {
                                  _registerButton(context);
                                }
                              }
                            : null,
                        text: state is LoadingSignupState
                            ? "Loading ..."
                            : "Sign up",
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
                                    builder: (context) => const LoginPage())),
                            child: Text(
                              " Login",
                              style: AppTexts.meduimBody.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _isEnabled() {
    if (_firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      _isButtonEnabled = true;
      setState(() {});
    } else {
      _isButtonEnabled = false;
    }
    setState(() {});
  }

  void _registerButton(BuildContext context) {
    BlocProvider.of<SignupCubit>(context).registerFuc(
        input: SignUpInput(
      email: _emailController.text,
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      password: _passwordController.text,
    ));
  }
}
