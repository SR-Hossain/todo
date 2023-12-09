import 'package:todo/data/model/todo_model.dart';

abstract class DataSource {
  Future<void> create();
  List<TodoModel> read();
  Future<void> update({
    required int index,
    String? title,
    String? description,
    bool? isComplete,
  });
  Future<void> delete({required int index});
}
