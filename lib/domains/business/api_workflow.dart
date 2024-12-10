import 'package:hyrule_app_lrdev/domains/models/entry.dart';

abstract class ApiWorkflow {
  Future<List<Entry>> getEntriesByCategory({required String category});
}
