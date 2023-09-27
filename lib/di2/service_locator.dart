import 'package:flutter_movie_clean/di2/app_module.dart';
import 'package:flutter_movie_clean/di2/repository_module.dart';
import 'package:flutter_movie_clean/di2/use_case_module.dart';
import 'package:flutter_movie_clean/di2/view_model_module.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> setup() async {
  await setupAppModule();
  setupViewModelModule();
  setupRepositoryModule();
  setupUseCaseModule();
}
