import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/dependency_injection.dart';
import 'package:todo/domain/model/todo.dart';
import 'package:todo/domain/usecase/fetch_todo_use_case.dart';
import 'package:todo/domain/usecase/modify_todo_use_case.dart';

class TodoListStateNotifier extends StateNotifier<List<Todo>> {
  TodoListStateNotifier(super.state) {
    state = getIt<FetchTodoUseCase>().call();
  }

  int getLength() => state.length;

  int getIdByIndex({required int index, bool reversed = false}) =>
      state[reversed ? getLength() - 1 - index : index].id;

  Todo getTodoById(int id) {
    List<Todo> todo = state.where((todo) => todo.id == id).toList();
    if (todo.isNotEmpty) return todo[0];
    return createNewBlankTodo(id: id);
  }

  int getNewAvailableId() {
    return getLength() == 0 ? 0 : state[getLength() - 1].id + 1;
  }

  Todo createNewBlankTodo({int? id}) {
    id ??= getNewAvailableId();
    Todo newTodo = Todo(id: id, title: '', description: '', isCompleted: false);
    state.add(newTodo);
    return newTodo;
  }

  updateTodo(
      {required int id, required String title, required String description}) {
    Todo todo = getTodoById(id);

    todo.id = getNewAvailableId();
    todo.title = title;
    todo.description = description;

    state.remove(todo);
    state.add(todo);

    getIt<ModifyTodoUseCase>().call(todoList: state);
  }

  deleteTodo({required int id}) {
    state.removeWhere((todo) => todo.id == id);

    getIt<ModifyTodoUseCase>().call(todoList: state);
  }

  void deleteMultipleTodos({required Set todosToBeDeletedById}) {
    for (var id in todosToBeDeletedById) {
      deleteTodo(id: id);
    }
  }

  String getTitleByIndex({required int index, bool reversed = false}) =>
      state[reversed ? getLength() - 1 - index : index].title;
  String getTitleById({required int id}) => getTodoById(id).title;

  String getDescriptionByIndex({required int index, bool reversed = false}) =>
      state[reversed ? getLength() - 1 - index : index].description;
  String getDescriptionById({required int id}) => getTodoById(id).description;

  markAsDone({required Set idSet}) {
    for (var id in idSet) {
      getTodoById(id).isCompleted ^= true;
    }

    getIt<ModifyTodoUseCase>().call(todoList: state);
  }
}
