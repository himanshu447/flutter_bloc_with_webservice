import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_practice/features/todo/core/failure.dart';
import 'package:flutter_bloc_practice/features/todo/core/usecase.dart';
import 'package:flutter_bloc_practice/features/todo/data/model/todo_model.dart';
import 'package:flutter_bloc_practice/features/todo/domain/repository/todo_repository.dart';

class RetrieveDataUseCase extends UseCase<List<ToDoModel>, NoParams> {
	final ToDoRepository toDoRepository;
	
	RetrieveDataUseCase({this.toDoRepository});

  @override
  Future<Either<Failure, List<ToDoModel>>> call(NoParams params) {
    return toDoRepository.retrieveData();
  }
	
	
}
