import 'package:flutter_movie_clean/domain/interactor/input/base_input.dart';
import 'package:flutter_movie_clean/domain/interactor/output/output_observer.dart';

abstract class BaseUseCase<Input extends BaseInput, Output> {
  Future<Output> buildUseCase(Input input);

  Future call(Input input, OutputObserver<Output> block) async {
    block.callSubscribe();
    try {
      final data = await buildUseCase(input);
      block.callSuccess(data);
    } catch (e) {
      block.callError(e);
    }
  }
}
