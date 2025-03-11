import 'package:flutter/material.dart';
import 'package:skinalyze/core/common/categories_body_widget.dart';

class VideosPage extends StatelessWidget {
  const VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoriesBodyWidget(
      appbarTitle: "Videos",
      widget: Column(),
    );
  }
}
