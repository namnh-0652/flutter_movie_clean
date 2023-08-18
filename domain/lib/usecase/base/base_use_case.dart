import 'package:domain/interactor/input/base_input.dart';

abstract class BaseUseCase<Input extends BaseInput, Output> {
  Future<Output> buildUseCase(Input input);
}
