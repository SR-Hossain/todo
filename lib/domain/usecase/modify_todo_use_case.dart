import 'package:todo/domain/model/todo.dart';
import 'package:todo/domain/repository_interface/todo_repository_interface.dart';

class ModifyTodoUseCase {
  final TodoRepositoryInterface _todoRepositoryInterface;

  ModifyTodoUseCase({
    required TodoRepositoryInterface todoRepositoryInterface,
  }) : _todoRepositoryInterface = todoRepositoryInterface;

  Future<void> call({required List<Todo> todoList}) async {
    _todoRepositoryInterface.save(
      todoList: todoList.map(
        (todo) {
          return {
            'id': todo.id,
            'title': todo.title,
            'description': todo.description,
            'isCompleted': todo.isCompleted,
          };
        },
      ).toList(),
    );
  }
}
