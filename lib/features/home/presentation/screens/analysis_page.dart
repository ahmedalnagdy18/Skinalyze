import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skinalyze/core/common/buttons.dart';
import 'package:skinalyze/core/common/categories_body_widget.dart';
import 'package:skinalyze/core/extentions/app_extention.dart';
import 'package:skinalyze/core/fonts/app_text.dart';
import 'package:skinalyze/features/home/presentation/cubits/upload_file_cubit/upload_file_cubit.dart';
import 'package:skinalyze/generated/l10n.dart';
import 'package:skinalyze/injection_container.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadFileCubit(uploadPhotoUsecase: sl()),
      child: const _AnalysisPage(),
    );
  }
}

class _AnalysisPage extends StatefulWidget {
  const _AnalysisPage();

  @override
  State<_AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<_AnalysisPage> {
  XFile? picked;
  bool uploaded = false;
  Future<void> pickAndUploadImage() async {
    final picker = ImagePicker();
    picked =
        await picker.pickImage(source: ImageSource.gallery); // <-- Fix here

    if (picked != null) {
      final file = File(picked!.path);
      context.read<UploadFileCubit>().upload(file);
      setState(() {
        uploaded = true;
      });
    } else {
      debugPrint('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadFileCubit, UploadFileState>(
      listener: (context, state) {
        if (state is UploadFileFailure) {
          showErrorToastMessage(message: state.message);
        }
      },
      builder: (context, state) {
        return CategoriesBodyWidget(
          arrowIcon: true,
          appbarTitle: S.of(context).analysis,
          centreWidget: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
            child: Column(
              children: [
                Text(
                  S.of(context).uploadPageTitle,
                  style: AppTexts.meduimHeading.copyWith(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 22.h),
              ],
            ),
          ),
          widget: Column(
            children: [
              if (uploaded == false) ...[
                SizedBox(height: appHight(context, 0.10)),
                SizedBox(
                  width: 250.r,
                  child: Image.asset("images/analysis.png"),
                ),
                Text(
                  S.of(context).uploadImageHere,
                  style: AppTexts.regularBody,
                ),
                SizedBox(height: 18.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: ColoredButtonWidget(
                    text: S.of(context).Upload,
                    onPressed: () {
                      pickAndUploadImage();
                      setState(() {});
                    },
                  ),
                ),
              ],
              if (uploaded == true) ...[
                Container(
                  constraints: BoxConstraints(
                    maxHeight: 300.r,
                    maxWidth: double.infinity,
                  ),
                  child: Image.file(
                    File(picked!.path),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 30.h),
                state is UploadFileLoading
                    ? CircularProgressIndicator(color: Colors.black)
                    : SizedBox(),
                state is UploadFileFailure
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).tryagian,
                            style: AppTexts.regularBody,
                          ),
                          SizedBox(width: 12.w),
                          InkWell(
                              onTap: () {
                                uploaded = false;
                                setState(() {});
                              },
                              child: Icon(Icons.refresh)),
                        ],
                      )
                    : SizedBox(),
                if (state is UploadFileSuccess) ...[
                  if (state.response.syndrome != null &&
                      state.response.syndrome!.isNotEmpty)
                    Column(
                      children: [
                        Text(
                          state.response
                              .syndrome!, // Directly display the syndrome string
                          style: AppTexts.regularBody
                              .copyWith(color: Colors.black),
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                            onTap: () {
                              uploaded = false;
                              setState(() {});
                            },
                            child: Icon(Icons.refresh)),
                      ],
                    )
                  else
                    Text(
                      S.of(context).noDetailsInResponse,
                      style: AppTexts.regularBody.copyWith(color: Colors.red),
                    ),
                ]
              ],
            ],
          ),
        );
      },
    );
  }
}
