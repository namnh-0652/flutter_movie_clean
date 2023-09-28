import 'package:flutter_movie_clean/domain/interactor/input/base_input.dart';
import 'package:flutter_movie_clean/domain/interactor/output/output_observer.dart';

abstract class BaseUseCase<Input extends BaseInput, Output> {
  Future<Output> buildUseCase(Input input);

  Future invoke(Input input, OutputObserver<Output> block) async {
    block.onLoading?.call();
    try {
      final data = await buildUseCase(input);
      block.onSuccess?.call(data);
    } catch (e) {
      block.onError?.call(e);
    } finally {
      block.onFinish?.call();
    }
  }
}
