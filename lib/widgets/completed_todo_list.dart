import 'package:bloc_studies/cubit/completed_todo_cubit.dart';
import 'package:bloc_studies/cubit/completed_todo_state.dart';
import 'package:bloc_studies/widgets/completed_todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletedTodoListWidget extends StatefulWidget {
  const CompletedTodoListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CompletedTodoListWidget> createState() =>
      _CompletedTodoListWidgetState();
}

class _CompletedTodoListWidgetState extends State<CompletedTodoListWidget> {
  @override
  void initState() {
    context.read<CompletedTodoCubit>().fetchCompletedTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompletedTodoCubit, CompletedTodoState>(
        builder: (context, state) {
      if (state is CompletedTodoLoaded) {
        final completedTodos = state.completedTodos;
        return Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
          child: ListView.builder(
              itemCount: completedTodos.length,
              itemBuilder: (context, index) {
                return CompletedTodoItemWidget(
                  todo: completedTodos[index],
                );
              }),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
