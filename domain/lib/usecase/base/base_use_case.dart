import 'package:domain/interactor/input/base_input.dart';
import 'package:domain/interactor/output/output_observer.dart';

abstract class BaseUseCase<Input extends BaseInput, Output> {
  Future<Output> buildUseCase(Input input);

  Future call(Input input, OutputObserver<Output> block) async {
    block.callSubscribe();
    try {
      final data = await buildUseCase(input);
      block.callSuccess(data);
    } on Exception catch (e) {
      block.callError(e);
    }
  }
}
