import 'package:todo/domain/model/todo.dart';
import 'package:todo/domain/repository_interface/todo_repository_interface.dart';

class FetchTodoUseCase {
  final TodoRepositoryInterface _todoRepositoryInterface;

  FetchTodoUseCase({
    required TodoRepositoryInterface todoRepositoryInterface,
  }) : _todoRepositoryInterface = todoRepositoryInterface;

  List<Todo> call() {
    List<Todo> todoList = [];
    for (var todo in _todoRepositoryInterface.fetch()) {
      todoList.add(Todo(
        id: todo['id'],
        title: todo['title'],
        description: todo['description'],
        isCompleted: todo['isCompleted'],
      ));
    }
    return todoList;
  }
}
