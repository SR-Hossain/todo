import 'package:todo/domain/repository/repository.dart';

class DeleteUseCase {
  Repository _repository;
  DeleteUseCase({required Repository repository}) : _repository = repository;
  Future<void> call({required int index}) async => await _repository.delete(index: index);
}