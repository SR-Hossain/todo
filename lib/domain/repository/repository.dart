import 'package:todo/data/datasource/data_source.dart';
import 'package:todo/domain/model/todo.dart';

abstract class Repository {
  Repository({required DataSource dataSource});

  Future<void> create();
  List<Todo> read();
  Future<void> update({
    required int index,
    String? title,
    String? description,
    bool? isComplete,
  });
  Future<void> delete({required int index});
}
