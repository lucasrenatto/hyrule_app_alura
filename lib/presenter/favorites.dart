import 'package:flutter/material.dart';
import 'package:hyrule_app_lrdev/controllers/dao_controller.dart';
import 'package:hyrule_app_lrdev/presenter/components/entry_card%20favorite.dart';

class Favorites extends StatefulWidget {
  Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final DaoController daoController = DaoController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favoritos'),
        ),
        body: FutureBuilder(
          future: daoController.getSavedEntries(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                var result = snapshot.data;
                return ListView.builder(
                  itemCount: result!.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                        background: Container(
                          color: Colors.red, // Fundo vermelho
                          alignment:
                              Alignment.centerRight, // Alinha o ícone à direita
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.delete, color: Colors.white, size: 30),
                              SizedBox(width: 10),
                              Text(
                                'Excluir',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        key: Key(result![index].id.toString()),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) async {
                          var removedItem = result[index];
                          try {
                            await daoController.deleteEntry(
                                entry: result[index]);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${result![index].name} foi removido',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                          } catch (err) {
                            setState(() {
                              result.insert(index, removedItem);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Erro ao Tentar Remover dos Favoritos',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        child: EntryCardFavorite(entry: result[index]));
                  },
                );
              } else {
                return const Center(
                  child: Text("Não foram encontrados itens"),
                );
              }
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Ocorreu um erro ao tentar buscar os favoritos"),
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
