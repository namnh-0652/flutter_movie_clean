import 'package:flutter_movie_clean/domain/interactor/output/output_observer.dart';

abstract class BaseNoInputUseCase<Output> {
  Future<Output> buildUseCase();

  Future<void> invoke(OutputObserver<Output> block) async {
    block.onLoading?.call();
    try {
      final data = await buildUseCase();
      block.onSuccess?.call(data);
    } catch (e) {
      block.onError?.call(e);
    } finally {
      block.onFinish?.call();
    }
  }
}
