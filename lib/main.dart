import 'package:flutter/material.dart';
import 'package:hyrule_app_lrdev/presenter/categories.dart';
import 'package:hyrule_app_lrdev/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hyrule',
      theme: themeData,
      home: const Categories(),
    );
  }
}
