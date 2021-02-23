import 'package:flutter_bloc_practice/features/todo/core/constant.dart';
import 'package:flutter_bloc_practice/features/todo/data/model/todo_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class ToDoDataSource {
  Future<int> insertToDo(ToDoModel toDoModel);

  Future<int> updateToDo(ToDoModel toDoModel);

  Future<int> deleteToDo(int id);

  Future<List<ToDoModel>> retrieveToDo();
}

class ToDoDataSourceImpl extends ToDoDataSource {
  final Database database;

  ToDoDataSourceImpl({
    this.database,
  });

  @override
  Future<int> insertToDo(ToDoModel toDoModel) async {
    try {
      return await database.insert(ConstantUtils.table, toDoModel.toMap());
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<int> updateToDo(ToDoModel toDoModel) async {
    try {
      return await database.update(ConstantUtils.table, toDoModel.toMap(),
          where: '${ConstantUtils.columnId} = ${toDoModel.id}',
          );
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<int> deleteToDo(int id) async {
    try {
      return await database.delete(ConstantUtils.table,
          where: '${ConstantUtils.columnId} = $id');
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<ToDoModel>> retrieveToDo() async {
    
    var result = await database.query(ConstantUtils.table);

    if (result.isEmpty) {
      return [];
    }
    
    return result.map((e) => ToDoModel.fromMap(map: e)).toList();
  }
}
