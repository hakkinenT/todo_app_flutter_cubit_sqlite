import 'package:bloc/bloc.dart';
import 'package:bloc_studies/cubit/completed_todo_state.dart';
import 'package:bloc_studies/repository/itodos_repository.dart';

class CompletedTodoCubit extends Cubit<CompletedTodoState> {
  final ITodosRepository _todosRepository;

  CompletedTodoCubit(this._todosRepository) : super(CompletedTodoInitial());

  void fetchCompletedTodos() {
    emit(CompletedTodoLoading());
    _todosRepository
        .getTodos(1)
        .then((todo) => emit(CompletedTodoLoaded(todo)));
  }
}
