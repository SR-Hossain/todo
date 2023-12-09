import 'package:todo/domain/repository/repository.dart';

class CreateUseCase {
  Repository _repository;
  CreateUseCase({required Repository repository}) : _repository = repository;
  Future<void> call() async => await _repository.create();
}
