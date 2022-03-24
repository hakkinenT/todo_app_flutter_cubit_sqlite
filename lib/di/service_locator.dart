import 'package:bloc_studies/cubit/completed_todo_cubit.dart';
import 'package:bloc_studies/cubit/todo_cubit.dart';
import 'package:bloc_studies/repository/itodos_repository.dart';
import 'package:bloc_studies/repository/todos_repository.dart';

import "package:get_it/get_it.dart";

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingleton<ITodosRepository>(TodoRepository());
  getIt.registerSingleton<TodosCubit>(TodosCubit(getIt<ITodosRepository>()));
  getIt.registerSingleton<CompletedTodoCubit>(
      CompletedTodoCubit(getIt<ITodosRepository>()));
}
