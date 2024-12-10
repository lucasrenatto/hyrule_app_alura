import 'package:hyrule_app_lrdev/data/dao/database.dart';
import 'package:hyrule_app_lrdev/data/dao/entry_dao.dart';
import 'package:hyrule_app_lrdev/domains/business/dao_workflow.dart';
import 'package:hyrule_app_lrdev/domains/models/entry.dart';

class DaoController implements DaoWorkflow {
  Future<EntryDao> createDatabase() async {
    final db =
        await $FloorAppDatabase.databaseBuilder("app_database.db").build();
    final EntryDao entryDao = db.entryDao;
    return entryDao;
  }

  @override
  Future<void> deleteEntry({required Entry entry}) async {
    final db = await createDatabase();
    await db.removeEntry(entry);
  }

  @override
  Future<List<Entry>> getSavedEntries() async {
    final db = await createDatabase();
    return await db.getAllEntries();
  }

  @override
  Future<void> saveEntry({required Entry entry}) async {
    final db = await createDatabase();
    return await db.addEntry(entry);
  }
}
