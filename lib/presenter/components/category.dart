import 'package:flutter/material.dart';
import 'package:hyrule_app_lrdev/presenter/results.dart';
import 'package:hyrule_app_lrdev/utils/const/categories.dart';

class Category extends StatelessWidget {
  const Category({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Results(
                  category: category,
                ),
              ),
            );
          },
          child: Center(
            child: Image.asset(
              "$imagePath$category.png",
              fit: BoxFit.cover,
              width: 150,
            ),
          ),
        ),
        Text(categories[category] ?? 'Categoria Não Encontrada')
      ],
    );
  }
}
