import 'package:todo/domain/model/todo.dart';
import 'package:todo/domain/repository/repository.dart';

class ReadUseCase {
  Repository _repository;
  ReadUseCase({required Repository repository}) : _repository = repository;
  List<Todo> call() => _repository.read();
}
