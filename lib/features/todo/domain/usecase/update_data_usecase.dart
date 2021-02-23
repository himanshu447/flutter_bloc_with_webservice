import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_practice/features/todo/core/failure.dart';
import 'package:flutter_bloc_practice/features/todo/core/usecase.dart';
import 'package:flutter_bloc_practice/features/todo/data/model/todo_model.dart';
import 'package:flutter_bloc_practice/features/todo/domain/repository/todo_repository.dart';

class UpdateDataUseCase extends UseCase<int, ToDoModel> {
  final ToDoRepository toDoRepository;

  UpdateDataUseCase({this.toDoRepository});

  @override
  Future<Either<Failure, int>> call(ToDoModel params) {
    return toDoRepository.updateData(toDoModel: params);
  }
}
