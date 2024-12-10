import 'package:flutter/material.dart';
import 'package:hyrule_app_lrdev/controllers/dao_controller.dart';
import 'package:hyrule_app_lrdev/domains/models/entry.dart';
import 'package:hyrule_app_lrdev/presenter/details.dart';

class EntryCardFavorite extends StatefulWidget {
  const EntryCardFavorite({super.key, required this.entry});
  final Entry entry;

  @override
  State<EntryCardFavorite> createState() => _EntryCardFavoriteState();
}

class _EntryCardFavoriteState extends State<EntryCardFavorite> {
  final DaoController dao = DaoController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Details(entry: widget.entry),
            ),
          );
        },
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Container(
                    width: 140,
                    height: 220,
                    child: Image.network(
                      widget.entry.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 230,
                      child: Text(
                        widget.entry.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Zelda',
                        ),
                      ),
                    ),
                    Container(
                      width: 230,
                      child: Text(widget.entry.description),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: widget.entry
                      .commonLocationsConverter()
                      .map(
                        (e) => Chip(
                          label: Text(
                            e,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: Colors.blueGrey,
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        ),
                      )
                      .toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
