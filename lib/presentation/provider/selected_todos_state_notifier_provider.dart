import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/presentation/notifier/selected_todos_state_notifier.dart';

var selectedTodosStateNotifierProvider =
    StateNotifierProvider<SelectedTodosStateNotifier, Set>(
        (ref) => SelectedTodosStateNotifier(<dynamic>{}));

