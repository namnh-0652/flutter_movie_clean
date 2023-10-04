import 'package:flutter_movie_clean/domain/interactor/input/base_input.dart';
import 'package:flutter_movie_clean/domain/interactor/output/output_observer.dart';

abstract class FutureUseCase<Input extends BaseInput, Output> {
  Future<Output> buildUseCase(Input input);
  Future call(Input input, OutputObserver<Output> block) async {
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

abstract class FutureNoInputUseCase<Output> {
  Future<Output> buildUseCase();
  Future call({OutputObserver<Output>? block}) async {
    block?.onLoading?.call();
    try {
      final data = await buildUseCase();
      block?.onSuccess?.call(data);
    } catch (e) {
      block?.onError?.call(e);
    } finally {
      block?.onFinish?.call();
    }
  }
}

abstract class FutureDirectUseCase<Input extends BaseInput, Output> {
  Future<Output> call(Input input);
}

abstract class FutureDirectNoInputUseCase<Input extends BaseInput, Output> {
  Future<Output> call();
}

abstract class DirectUseCase<Input extends BaseInput, Output> {
  Output call(Input input);
}

abstract class DirectNoInputUseCase<Output> {
  Output call();
}
