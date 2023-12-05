import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedTodosStateNotifier extends StateNotifier<Set> {
  SelectedTodosStateNotifier(super.state);

  void processIndex(int id) {
    // state = {1};
    if (state.contains(id)) {
      state.remove(id);
    } else {
      state.add(id);
    }
    state = state.toSet();
    // print(state);
  }

  bool isSelected(int id) {
    return state.contains(id);
  }

  int howManyTodoSelected() {
    return state.length;
  }

  void reset() {
    state = {};
  }
}
