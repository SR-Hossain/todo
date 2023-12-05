import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/domain/model/todos.dart';
import 'package:todo/presentation/notifier/todos_state_notifier.dart';
import 'package:get_it/get_it.dart';

var todosStateNotifierProvider =
    StateNotifierProvider<TodosStateNotifier, Todos>(
        (ref) => TodosStateNotifier(GetIt.instance<Todos>()));

