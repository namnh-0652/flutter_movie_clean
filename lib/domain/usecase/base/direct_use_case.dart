import 'package:flutter_movie_clean/domain/interactor/input/base_input.dart';

abstract class DirectUseCase<Input extends BaseInput, Output> {
  Output call(Input input);
}

abstract class DirectNoInputUseCase<Output> {
  Output call();
}
