import 'dart:io';

import 'package:flutter_bloc_practice/features/todo/core/constant.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataHelper {
  


  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, ConstantUtils.databaseName);
    return await openDatabase(
      path,
      version: ConstantUtils.databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE ${ConstantUtils.table} (
            ${ConstantUtils.columnId} INTEGER PRIMARY KEY,
            ${ConstantUtils.columnTitle} TEXT NOT NULL,
            ${ConstantUtils.columnDesc} Text NOT NULL,
            ${ConstantUtils.columnDate} INTEGER
          )
          ''');
  }
}
