import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/dependency_injection.dart';
import 'package:todo/domain/model/todo.dart';
import 'package:todo/domain/usecase/fetch_todo_use_case.dart';
import 'package:todo/presentation/notifier/todo_list_state_notifier.dart';

var todoListProvider = StateNotifierProvider<TodoListStateNotifier, List<Todo>>(
    (ref) => TodoListStateNotifier([]));
