import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_practice/features/todo/core/failure.dart';
import 'package:flutter_bloc_practice/features/todo/data/model/todo_model.dart';

abstract class ToDoRepository {
  Future<Either<Failure, int>> insertData({ToDoModel toDoModel});
  Future<Either<Failure, int>> updateData({ToDoModel toDoModel});
  Future<Either<Failure, int>> deleteData({int id});
  Future<Either<Failure, List<ToDoModel>>> retrieveData();
}

