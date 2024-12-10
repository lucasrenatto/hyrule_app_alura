import 'package:flutter/material.dart';
import 'package:hyrule_app_lrdev/controllers/api_controller.dart';
import 'package:hyrule_app_lrdev/presenter/components/entry_card.dart';
import 'package:hyrule_app_lrdev/presenter/favorites.dart';
import 'package:hyrule_app_lrdev/utils/const/categories.dart';

class Results extends StatelessWidget {
  Results({super.key, required this.category});
  final String category;

  final ApiController apiController = ApiController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(categories[category]!),
          actions: [
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Favorites(),
                ),
              ),
              icon: const Icon(
                Icons.favorite,
              ),
            )
          ],
        ),
        body: FutureBuilder(
          future: apiController.getEntriesByCategory(category: category),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return EntryCard(entry: snapshot.data![index]);
                  },
                );
              } else {
                return const Center(
                  child: Text("Não foram encontrados itens"),
                );
              }
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Ocorreu um erro ao tentar buscar $category"),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
