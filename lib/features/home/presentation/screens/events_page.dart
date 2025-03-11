import 'package:flutter/material.dart';
import 'package:skinalyze/core/common/categories_body_widget.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoriesBodyWidget(
      appbarTitle: "Events",
      widget: Column(),
    );
  }
}
