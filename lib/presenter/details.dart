import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hyrule_app_lrdev/controllers/dao_controller.dart';
import 'package:hyrule_app_lrdev/domains/models/entry.dart';

class Details extends StatelessWidget {
  Details({super.key, required this.entry});
  final Entry entry;
  final DaoController daoController = DaoController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detalhes'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                entry.name,
                style: const TextStyle(
                  fontSize: 48,
                  fontFamily: 'Zelda',
                ),
              ),
              Wrap(
                children: entry
                    .commonLocationsConverter()
                    .map((e) => Chip(label: Text(e)))
                    .toList(),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(58.0),
                  ),
                ),
                width: double.infinity,
                child: Image.network(
                  entry.image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(entry.description)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            daoController.saveEntry(entry: entry);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Salvo aos Favoritos',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.green,
              ),
            );
          },
          child: const Icon(Icons.favorite),
        ),
      ),
    );
  }
}
