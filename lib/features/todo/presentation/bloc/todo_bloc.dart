import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice/features/todo/core/usecase.dart';
import 'package:flutter_bloc_practice/features/todo/data/model/todo_model.dart';
import 'package:flutter_bloc_practice/features/todo/domain/usecase/delete_data_usecase.dart';
import 'package:flutter_bloc_practice/features/todo/domain/usecase/insert_data_usecase.dart';
import 'package:flutter_bloc_practice/features/todo/domain/usecase/retrieve_data_usecase.dart';
import 'package:flutter_bloc_practice/features/todo/domain/usecase/update_data_usecase.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final InsertDataUseCase insertDataUseCase;
  final RetrieveDataUseCase retrieveDataUseCase;
  final UpdateDataUseCase updateDataUseCase;
  final DeleteDataUseCase deleteDataUseCase;

  TodoBloc({
    this.insertDataUseCase,
    this.deleteDataUseCase,
    this.updateDataUseCase,
    this.retrieveDataUseCase,
  }) : super(TodoInitial());

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is RetrieveToDoEvent) {
      yield ToDoLoading();

      var result = await retrieveDataUseCase(NoParams());

      yield* result.fold((l) async* {
        print(l.toString());
      }, (r) async* {
        print(r.length);
        yield ToDoLoaded(toDoList: r);
      });
    }
    
    else if (event is AddToDoEvent) {
      
      var result = await insertDataUseCase(event.toDoModel);

      yield* result.fold((l) async*{
        print(l.toString());
      }, (r) async*{
        var list = state.list;
        list.add(ToDoModel(title: event.toDoModel.title,description: event.toDoModel.description,id: r,createdOn: DateTime.now().millisecondsSinceEpoch));
        yield ToDoLoaded(toDoList: list);
      });
    }

    else if (event is DeleteToDoEvent) {
  
      var result = await deleteDataUseCase(event.id);
  
      yield* result.fold((l) async*{
        print(l.toString());
      }, (r) async*{
        
        var list = state.list;
        
        var index = list.indexWhere((element) => element.id == event.id);
        
        list.removeAt(index);
        
        yield ToDoLoaded(toDoList: list);
      });
    }

    else if (event is UpdateToDoEvent) {
  
      var result = await updateDataUseCase(event.toDoModel);
  
      yield* result.fold((l) async*{
        
        print(l.toString());
        
      }, (r) async*{
    
        var list = state.list;
    
        var updateIndex = state.list.indexWhere((element) => element.id == event.toDoModel.id);

        state.list[updateIndex] = state.list[updateIndex].copyWith(
          tempTitle: event.toDoModel.title,
          tempDescription: event.toDoModel.description,
          tempCreatedOn:DateTime.now().millisecondsSinceEpoch
        );
        
        yield ToDoLoaded(toDoList: list);
      });
    }
  
  }
}
