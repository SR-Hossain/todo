import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedTodosStateNotifier extends StateNotifier<Set> {
  SelectedTodosStateNotifier(super.state);

  void processIndex(int id) {
    state.contains(id) ? state.remove(id) : state.add(id);

    state = state.toSet();
  }

  Set getIdSet() => state;

  bool isSelected(int id) => state.contains(id);

  int howManyTodoSelected() => state.length;

  void reset() => state = {};
}
