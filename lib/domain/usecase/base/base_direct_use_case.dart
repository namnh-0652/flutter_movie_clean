import 'package:flutter_movie_clean/domain/interactor/input/base_input.dart';

abstract class BaseDirectUseCase<Input extends BaseInput, Output> {
  Future<Output> invoke(Input input);
}
