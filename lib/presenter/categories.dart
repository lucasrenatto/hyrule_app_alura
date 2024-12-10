import 'package:flutter/material.dart';
import 'package:hyrule_app_lrdev/presenter/components/category.dart';
import 'package:hyrule_app_lrdev/utils/const/categories.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Escolha uma categoria"),
          centerTitle: true,
        ),
        body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          children: categories.keys.map((e) => Category(category: e)).toList(),
        ),
      ),
    );
  }
}
