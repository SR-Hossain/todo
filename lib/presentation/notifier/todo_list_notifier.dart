import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/dependency_injection.dart';
import 'package:todo/domain/model/todo.dart';
import 'package:todo/domain/usecase/create_use_case.dart';
import 'package:todo/domain/usecase/delete_use_case.dart';
import 'package:todo/domain/usecase/read_use_case.dart';
import 'package:todo/domain/usecase/update_use_case.dart';

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier(super.state) {
    read();
  }

  Future<void> create() async {
    await getIt<CreateUseCase>().call();
    read();
  }

  void read() {
    state = getIt<ReadUseCase>().call();
  }

  Future<void> update(
      {required int index, String? title, String? description, bool? isComplete}) async {
    await getIt<UpdateUseCase>()
        .call(index: index, title: title, description: description, isComplete: isComplete);
    read();
  }

  Future<void> delete({required int index}) async =>
      await getIt<DeleteUseCase>().call(index: index);

  Future<void> deleteSet(List<int> toDelete) async{
      for(int index in toDelete){
        await delete(index: index);
      }
      read();
  }

  Future<void> toggleIsCompleteMarkedSet(List<int> toToggle) async {
    for(int index in toToggle){
      await update(index: index, isComplete: !state[index].isComplete);
    }
    read();
  }
}

final todoListProvider =
    StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) => TodoListNotifier([]));
