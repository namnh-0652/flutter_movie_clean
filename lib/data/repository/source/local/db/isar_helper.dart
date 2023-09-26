import 'package:flutter_movie_clean/data/model/account_data.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

final class IsarHelper {
  static Future<Isar> getInstance() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open([AccountDataSchema], directory: dir.path);
  }
}
