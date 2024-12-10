import 'package:hyrule_app_lrdev/domains/models/entry.dart';

abstract class DaoWorkflow {
  Future<List<Entry>> getSavedEntries();
  Future<void> saveEntry({required Entry entry});
  Future<void> deleteEntry({required Entry entry});
}
