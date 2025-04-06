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

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({super.key});

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  Future<void> pickAndUploadImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      final file = File(picked.path);
      context.read<UploadFileCubit>().upload(file);
    } else {
      debugPrint('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CategoriesBodyWidget(
      arrowIcon: true,
      appbarTitle: "Analysis",
      centreWidget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
        child: Column(
          children: [
            Text(
              "Upload your image to make Ai to analylize it",
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
          SizedBox(height: appHight(context, 0.10)),
          SizedBox(
            width: 250.r,
            child: Image.asset("images/analysis.png"),
          ),
          Text(
            "Upload image here",
            style: AppTexts.regularBody,
          ),
          SizedBox(height: 18.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: ColoredButtonWidget(
              text: "Upload",
              onPressed: pickAndUploadImage,
            ),
          )
        ],
      ),
    );
  }
}
