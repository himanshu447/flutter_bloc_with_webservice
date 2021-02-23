part of 'todo_bloc.dart';

@immutable
abstract class TodoState {
  final List<ToDoModel> list;

  TodoState({this.list});
}

class TodoInitial extends TodoState {}

class ToDoLoading extends TodoState {}

class ToDoLoaded extends TodoState {
  final List<ToDoModel> toDoList;

  ToDoLoaded({this.toDoList}) : super(list: toDoList);
}
