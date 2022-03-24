import 'package:bloc_studies/database/db_provider.dart';
import 'package:bloc_studies/models/todo_model.dart';
import 'package:sqflite/sqflite.dart';

class SqliteApi {
  Future<int> insertTodo(TodoModel todo) async {
    final db = await DBProvider.instance.database;

    return await db.insert('todos', todo.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /*Future<List<TodoModel>> getTodos() async {
    final db = await DBProvider.instance.database;
    final List<Map<String, dynamic>> todosJson =
        await db.query('todos', orderBy: "creationDate");
    return todosJson.map((todo) => TodoModel.fromJson(todo)).toList();
  }*/

  Future<List<TodoModel>> getTodos(int status) async {
    final db = await DBProvider.instance.database;
    final List<Map<String, dynamic>> todosJson =
        await db.query('todos', where: "isCompleted = ?", whereArgs: [status]);
    return todosJson.map((todo) => TodoModel.fromJson(todo)).toList();
  }

  Future<int> updateTodo(TodoModel todo) async {
    final db = await DBProvider.instance.database;
    return await db
        .update('todos', todo.toJson(), where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<int> deleteTodo(String id) async {
    final db = await DBProvider.instance.database;
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }
}
