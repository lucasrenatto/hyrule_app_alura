import 'package:floor/floor.dart';
import 'package:hyrule_app_lrdev/domains/models/entry.dart';

@dao
abstract class EntryDao {
  @Query('SELECT * FROM ENTRY')
  Future<List<Entry>> getAllEntries();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addEntry(Entry entry);

  @delete
  Future<void> removeEntry(Entry entry);
}
