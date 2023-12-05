import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/domain/model/todo.dart';
import 'package:todo/domain/model/todos.dart';
import 'package:todo/domain/usecase/todos/create_new_todo_use_case.dart';
import 'package:todo/domain/usecase/todos/mark_todo_as_done_use_case.dart';
import 'package:todo/domain/usecase/todos/remove_todo_use_case.dart';
import 'package:todo/domain/usecase/todos/update_todo_use_case.dart';

class TodosStateNotifier extends StateNotifier<Todos> {
  TodosStateNotifier(super.state);

  Future<void> removeTodos(Set todosToBeRemoved) async {
    for (var id in todosToBeRemoved) {
      state = await RemoveTodoUseCase(todos: state, id: id).call();
    }
  }

  Future<void> markAsDone(Set todosToBeMarked) async {
    print('to be marked: $todosToBeMarked');
    for (var id in todosToBeMarked) {
      await MarkTodoUseCaseDone(todos: state, id: id).call();
    }
    print('to be marked again: $todosToBeMarked');

    print(state.toString());
    // print(todosToBeMarked.toString());
  }

  int getId(int index) {
    return state.getTodos()[index].id;
  }

  Todo _getTodoById(int id) {
    return state.getTodos().where((element) => element.id == id).toList()[0];
  }

  String todoTitle(int id) {
    return _getTodoById(id).title;
  }

  String todoDescription(int id) {
    return _getTodoById(id).description;
  }

  Future<void> updateTodo({
    required id,
    required String title,
    required String description,
  }) async {
    Todo todo = _getTodoById(id);
    await UpdateTodoUseCase(
            todos: state, todo: todo, title: title, description: description)
        .call();
  }

  int getLength() => state.getTodosLength();

  int availableIdForNewTodo() => state.getTodos()[getLength() - 1].id + 1;

  int createNewBlankTodo() {
    int id = availableIdForNewTodo();
    CreateNewTodoUseCase(todos: state).call(id: id);
    return id;
  }
}
