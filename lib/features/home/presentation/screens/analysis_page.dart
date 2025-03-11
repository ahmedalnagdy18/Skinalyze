import 'package:flutter/material.dart';
import 'package:skinalyze/core/common/categories_body_widget.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoriesBodyWidget(
      appbarTitle: "Analysis",
      widget: Column(),
    );
  }
}
