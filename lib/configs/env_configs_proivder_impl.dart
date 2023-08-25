import 'package:domain/configs/env_configs_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfigsProviderImpl extends EnvConfigsProvider {
  @override
  String get baseUrl => dotenv.get("BASE_URL");

  @override
  String get currentEnvironment => dotenv.get("ENVIRONMENT");

  @override
  String get baseImageUrl => dotenv.get("IMAGE_BASE_URL");
}
