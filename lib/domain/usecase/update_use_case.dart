import 'package:todo/domain/repository/repository.dart';

class UpdateUseCase {
  Repository _repository;
  UpdateUseCase({required Repository repository}) : _repository = repository;
  Future<void> call({
    required int index,
    String? title,
    String? description,
    bool? isComplete,
  }) async =>
      await _repository.update(index: index, title: title, description: description, isComplete: isComplete);
}
