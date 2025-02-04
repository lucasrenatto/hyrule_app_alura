import 'dart:async';
import 'package:floor/floor.dart';
import 'package:hyrule_app_lrdev/data/dao/entry_dao.dart';
import 'package:hyrule_app_lrdev/domains/models/entry.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Entry])
abstract class AppDatabase extends FloorDatabase {
  EntryDao get entryDao;
}
