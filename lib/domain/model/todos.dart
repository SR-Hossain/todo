import 'package:todo/domain/model/todo.dart';

class Todos {
  List<Todo> _todos = [];
  List<Todo> getTodos() => _todos;
  void setTodos(List<Todo> todos) {
    _todos = todos;
  }

  @override
  String toString() {
    return getTodos()
        .map((e) => {
              'id': e.id,
              'title': e.title,
              'description': e.description,
              'isComplete': e.isComplete
            })
        .toList()
        .toString();
  }

  int getTodosLength() => _todos.length;
}
