import 'package:bloc_studies/models/todo_model.dart';

abstract class ITodosRepository {
  const ITodosRepository();

  Future<List<TodoModel>> getTodos(int status);

  Future<int> addTodo(TodoModel todo);

  Future<int> deleteTodo(String id);

  Future<int> updateTodo(TodoModel todo);

  //Future<List<TodoModel>> getCompletedTodos();
}
