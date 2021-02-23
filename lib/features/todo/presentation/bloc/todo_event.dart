part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class AddToDoEvent extends TodoEvent {
  final ToDoModel toDoModel;

  AddToDoEvent({
    this.toDoModel,
  });
}

class RetrieveToDoEvent extends TodoEvent {}

class DeleteToDoEvent extends TodoEvent {
  final int id;

  DeleteToDoEvent({this.id});
}

class UpdateToDoEvent extends TodoEvent {
  
  final ToDoModel toDoModel;

  UpdateToDoEvent({
    this.toDoModel,
  });
}
