import 'package:bloc_studies/models/todo_model.dart';
import 'package:equatable/equatable.dart';

abstract class CompletedTodoState extends Equatable {}

class CompletedTodoInitial extends CompletedTodoState {
  @override
  List<Object?> get props => [];
}

class CompletedTodoLoading extends CompletedTodoState {
  @override
  List<Object?> get props => [];
}

class CompletedTodoLoaded extends CompletedTodoState {
  CompletedTodoLoaded(this.completedTodos);

  final List<TodoModel> completedTodos;

  @override
  List<Object?> get props => [completedTodos];
}
