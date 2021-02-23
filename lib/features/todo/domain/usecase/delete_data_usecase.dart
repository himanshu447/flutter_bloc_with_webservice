import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_practice/features/todo/core/failure.dart';
import 'package:flutter_bloc_practice/features/todo/core/usecase.dart';
import 'package:flutter_bloc_practice/features/todo/data/model/todo_model.dart';
import 'package:flutter_bloc_practice/features/todo/domain/repository/todo_repository.dart';

class DeleteDataUseCase extends UseCase<int, int> {
  final ToDoRepository toDoRepository;

  DeleteDataUseCase({this.toDoRepository});

  @override
  Future<Either<Failure, int>> call(int params) {
    return toDoRepository.deleteData(id: params);
  }
}
