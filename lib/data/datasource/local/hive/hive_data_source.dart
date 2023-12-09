import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/datasource/data_source.dart';
import 'package:todo/data/model/todo_model.dart';

class HiveDataSource implements DataSource {
  final Box _database;
  HiveDataSource({required Box database}) : _database = database;

  @override
  Future<void> create() async {
    await _database.add(TodoModel().toMap());
  }

  @override
  List<TodoModel> read() {
    return _database.values
        .map((todo) => TodoModel(
              title: todo['title'],
              description: todo['description'],
              isComplete: todo['isComplete'],
            ))
        .toList();
  }

  @override
  Future<void> update({
    required int index,
    String? title,
    String? description,
    bool? isComplete,
  }) async {
    if (index == -1) {
      print('update e ashse');
      await _database.add(TodoModel(
          title: title ?? '', description: description ?? '', isComplete: isComplete ?? false).toMap());
      print('update e abar ashse');
      return;
    }
    if (index>=_database.length) return;
    Map todo = _database.getAt(index);
    if (title != null) todo['title'] = title;
    if (description != null) todo['description'] = description;
    if (isComplete != null) {
      todo['isComplete'] = isComplete;
      await _database.putAt(index, todo);
    }
    else{
      await delete(index: index);
      await _database.add(todo);
    }
  }

  @override
  Future<void> delete({required int index}) async {
    await _database.deleteAt(index);
  }
}
