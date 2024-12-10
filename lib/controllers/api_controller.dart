import 'package:hyrule_app_lrdev/data/api/data_api.dart';
import 'package:hyrule_app_lrdev/domains/business/api_workflow.dart';
import 'package:hyrule_app_lrdev/domains/models/entry.dart';

class ApiController implements ApiWorkflow {
  final DataApi dataApi = DataApi();

  @override
  Future<List<Entry>> getEntriesByCategory({required String category}) async {
    return await dataApi.getEntriesByCategory(category: category);
  }
}
