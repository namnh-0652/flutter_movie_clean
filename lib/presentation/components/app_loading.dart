import 'package:flutter/material.dart';
import 'package:flutter_movie_clean/presentation/pages/base/loading_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppLoading extends ConsumerWidget {
  const AppLoading({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loadingStateProvider);
    return Stack(children: [
      child,
      if (isLoading)
        const Center(child: CircularProgressIndicator())
      else
        const SizedBox()
    ]);
  }
}
