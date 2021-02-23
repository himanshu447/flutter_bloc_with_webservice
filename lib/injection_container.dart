import 'package:flutter_bloc_practice/features/todo/data/datasource/database_helper.dart';
import 'package:flutter_bloc_practice/features/todo/data/datasource/todo_datasource.dart';
import 'package:flutter_bloc_practice/features/todo/data/repository/todo_repository_impl.dart';
import 'package:flutter_bloc_practice/features/todo/domain/repository/todo_repository.dart';
import 'package:flutter_bloc_practice/features/todo/domain/usecase/delete_data_usecase.dart';
import 'package:flutter_bloc_practice/features/todo/domain/usecase/retrieve_data_usecase.dart';
import 'package:flutter_bloc_practice/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

import 'features/todo/domain/usecase/insert_data_usecase.dart';
import 'features/todo/domain/usecase/update_data_usecase.dart';

final GetIt getIt = GetIt.instance;

Future setUp() async {
  
  ///External
  Database database = await DataHelper().database;
  getIt.registerLazySingleton(() => database);

  ///Repository
  getIt.registerLazySingleton<ToDoRepository>(
    () => ToDoRepositoryImpl(
      toDoDataSource: getIt(),
    ),
  );

  ///DataSource
  getIt.registerLazySingleton<ToDoDataSource>(
    () => ToDoDataSourceImpl(
      database: getIt(),
    ),
  );

  /// Insert useCase
  getIt.registerLazySingleton(
    () => InsertDataUseCase(
      toDoRepository: getIt(),
    ),
  );

  /// Update useCase
  getIt.registerLazySingleton(
        () => UpdateDataUseCase(
      toDoRepository: getIt(),
    ),
  );

  /// Delete useCase
  getIt.registerLazySingleton(
        () => DeleteDataUseCase(
      toDoRepository: getIt(),
    ),
  );

  /// Retrieve useCase
  getIt.registerLazySingleton(
        () => RetrieveDataUseCase(
      toDoRepository: getIt(),
    ),
  );
  

  ///bloc
  getIt.registerLazySingleton(
    () => TodoBloc(
      insertDataUseCase: getIt(),
      deleteDataUseCase: getIt(),
      updateDataUseCase: getIt(),
      retrieveDataUseCase: getIt(),
    ),
  );
  
}
