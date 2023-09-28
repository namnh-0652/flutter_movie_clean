import 'package:flutter_dotenv/flutter_dotenv.dart';

final class EnvConfigs {
  static Future<void> load(String environment) async {
    return dotenv.load(fileName: "assets/env/.env.$environment");
  }

  static String get baseUrl => dotenv.get("BASE_URL");

  static String get baseImageUrl => dotenv.get("IMAGE_BASE_URL");
}
