import 'package:flutter_movie_clean/di2/service_locator.dart';
import 'package:flutter_movie_clean/presentation/pages/home/home_view_model.dart';

void setupViewModelModule() {
  locator.registerFactory(() => HomeViewModel(locator(), locator(), locator()));
}
