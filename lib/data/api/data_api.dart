import 'package:dio/dio.dart';
import 'package:hyrule_app_lrdev/domains/models/entry.dart';
import 'package:hyrule_app_lrdev/utils/const/api.dart';

class DataApi {
  final Dio dio = Dio();
  List<Entry> entries = [];

  Future<List<Entry>> getEntriesByCategory({required String category}) async {
    final response = await dio.get(
      "$urlGetEntriesByCategory$category",
    );
    entries = List<Entry>.from(
      response.data["data"].map(
        (e) => Entry.fromMap(e),
      ),
    );
    return entries;
  }
}
