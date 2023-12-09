import 'package:todo/data/datasource/data_source.dart';
import 'package:todo/data/model/todo_model.dart';
import 'package:todo/domain/repository/repository.dart';

class RepositoryImplementation extends Repository {
  DataSource _dataSource;
  RepositoryImplementation({required super.dataSource})
      : _dataSource = dataSource;

  @override
  Future<void> create() => _dataSource.create();

  @override
  Future<void> delete({required int index}) => _dataSource.delete(index: index);

  @override
  List<TodoModel> read() => _dataSource.read();

  @override
  Future<void> update({
    required int index,
    String? title,
    String? description,
    bool? isComplete,
  }) async =>
      _dataSource.update(
          index: index,title: title,description: description,isComplete: isComplete);
}
