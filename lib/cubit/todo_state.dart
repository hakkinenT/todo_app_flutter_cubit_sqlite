import 'package:bloc_studies/models/todo_model.dart';
import 'package:equatable/equatable.dart';

abstract class TodosState extends Equatable {}

class TodosInitial extends TodosState {
  @override
  List<Object?> get props => [];
}

class TodosAdded extends TodosState {
  @override
  List<Object?> get props => [];
}

class TodosLoading extends TodosState {
  @override
  List<Object?> get props => [];
}

class TodosLoaded extends TodosState {
  TodosLoaded(this.todos);

  final List<TodoModel> todos;

  @override
  List<Object?> get props => [todos];
}

class TodoError extends TodosState {
  final String error;

  TodoError(this.error);

  @override
  List<Object?> get props => throw UnimplementedError();
}
