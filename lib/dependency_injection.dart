import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/datasource/data_source.dart';
import 'package:todo/data/datasource/local/hive/hive_data_source.dart';
import 'package:todo/data/repository/repository_implementation.dart';
import 'package:todo/domain/repository/repository.dart';
import 'package:todo/domain/usecase/create_use_case.dart';
import 'package:todo/domain/usecase/delete_use_case.dart';
import 'package:todo/domain/usecase/read_use_case.dart';
import 'package:todo/domain/usecase/update_use_case.dart';

GetIt getIt = GetIt.instance;

Future<void> initDatabase() async {
  await Hive.initFlutter();
  getIt.registerSingleton<DataSource>(HiveDataSource(
    database: await Hive.openBox('todoData'),
  ));
}

void injectDataSourceDependencyIntoRepository() {
  getIt.registerSingleton<Repository>(
      RepositoryImplementation(dataSource: getIt<DataSource>()));
}

void injectRepositoryDependencyIntoUseCase() {
  Repository repository = getIt<Repository>();
  getIt.registerSingleton<CreateUseCase>(CreateUseCase(repository: repository));
  getIt.registerSingleton<ReadUseCase>(ReadUseCase(repository: repository));
  getIt.registerSingleton<UpdateUseCase>(UpdateUseCase(repository: repository));
  getIt.registerSingleton<DeleteUseCase>(DeleteUseCase(repository: repository));
}
