import 'package:bloc_studies/database/sqlite_api.dart';
import 'package:bloc_studies/models/todo_model.dart';
import 'package:bloc_studies/repository/itodos_repository.dart';

class TodoRepository implements ITodosRepository {
  final _api = SqliteApi();

  @override
  Future<int> addTodo(TodoModel todo) async {
    try {
      final result = await _api.insertTodo(todo);
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<int> updateTodo(TodoModel todo) async {
    try {
      final result = await _api.updateTodo(todo);
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<int> deleteTodo(String id) async {
    try {
      var result = await _api.deleteTodo(id);
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /*@override
  Future<List<TodoModel>> getCompletedTodos() async {
    try {
      final completedTodos = await _api.getTodos(1);
      return completedTodos;
    } catch (e) {
      throw Exception(e.toString());
    }
  }*/

  @override
  Future<List<TodoModel>> getTodos(int status) async {
    try {
      final todos = await _api.getTodos(status);
      return todos;
    } catch (e) {
      throw Exception(e);
    }
  }
}
