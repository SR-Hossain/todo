import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedTodoNotifier extends StateNotifier<List<int>> {
  SelectedTodoNotifier(super.state);

  void reset() => state = [];

  void markOrNot({required index}) {
    state.contains(index) ? state.remove(index) : state.add(index);
    state = state.toList();
  }
}

final selectedTodoProvider =
    StateNotifierProvider<SelectedTodoNotifier, List<int>>(
        (ref) => SelectedTodoNotifier([]));
