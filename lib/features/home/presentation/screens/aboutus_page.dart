import 'package:flutter/material.dart';
import 'package:skinalyze/core/common/categories_body_widget.dart';

class AboutusPage extends StatelessWidget {
  const AboutusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoriesBodyWidget(
      appbarTitle: "About us",
      widget: Column(),
    );
  }
}
