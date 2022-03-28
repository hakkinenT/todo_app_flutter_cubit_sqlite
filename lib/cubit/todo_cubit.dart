import 'package:bloc/bloc.dart';
import 'package:bloc_studies/cubit/todo_state.dart';
import 'package:bloc_studies/models/todo_model.dart';
import 'package:bloc_studies/repository/itodos_repository.dart';

class TodosCubit extends Cubit<TodosState> {
  final ITodosRepository _todosRepository;

  TodosCubit(this._todosRepository) : super(TodosInitial());

  void addTodo(TodoModel todo) async {
    if (todo.description.isEmpty) {
      emit(TodoError('Informe uma Tarefa.'));
      return;
    }
    await _todosRepository.addTodo(todo);
    emit(TodosAdded());
  }

  void fetchTodos() async {
    emit(TodosLoading());
    final todos = await _todosRepository.getTodos(0);
    if (todos.isEmpty) {
      emit(TodosInitial());
      return;
    }
    emit(TodosLoaded(todos));
  }

  void updateTodo(TodoModel todo) async {
    await _todosRepository.updateTodo(todo);
  }

  void deleteTodo(TodoModel todo) async {
    await _todosRepository.deleteTodo(todo.id!);
  }
}
