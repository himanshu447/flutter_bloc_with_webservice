import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_practice/features/todo/core/failure.dart';
import 'package:flutter_bloc_practice/features/todo/data/datasource/todo_datasource.dart';
import 'package:flutter_bloc_practice/features/todo/data/model/todo_model.dart';
import 'package:flutter_bloc_practice/features/todo/domain/repository/todo_repository.dart';

class ToDoRepositoryImpl extends ToDoRepository {
  final ToDoDataSource toDoDataSource;

  ToDoRepositoryImpl({this.toDoDataSource});

  @override
  Future<Either<Failure, int>> insertData({ToDoModel toDoModel}) async {
    try {
      var result = await toDoDataSource.insertToDo(toDoModel);
      return Right(result);
    } catch (e) {
      return Left(Error(error: e));
    }
  }

  @override
  Future<Either<Failure, int>> updateData({ToDoModel toDoModel}) async {
    try {
      var result = await toDoDataSource.updateToDo(toDoModel);
      return Right(result);
    } catch (e) {
      return Left(Error(error: e));
    }
  }

  @override
  Future<Either<Failure, int>> deleteData({int id}) async {
    try {
      var result = await toDoDataSource.deleteToDo(id);
      return Right(result);
    } catch (e) {
      return Left(Error(error: e));
    }
  }

  @override
  Future<Either<Failure, List<ToDoModel>>> retrieveData() async {
    try {
      var result = await toDoDataSource.retrieveToDo();
      return Right(result);
    } catch (e) {
      return Left(Error(error: e));
    }
  }
}
