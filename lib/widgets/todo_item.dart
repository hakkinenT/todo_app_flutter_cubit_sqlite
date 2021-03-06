import 'package:bloc_studies/cubit/todo_cubit.dart';
import 'package:bloc_studies/models/todo_model.dart';
import 'package:bloc_studies/theme/app_colors.dart';
import 'package:bloc_studies/theme/app_text_styles.dart';
import 'package:bloc_studies/widgets/edit_todo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ListTileTodosWidget extends StatelessWidget {
  final TodoModel todo;
  const ListTileTodosWidget({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      confirmDismiss: (DismissDirection direction) async {
        if (direction == DismissDirection.startToEnd) {
          return await showDialog(
              context: context,
              builder: (BuildContext ctx) {
                return AlertDialog(
                  title: const Text('Confirmação de Exclusão'),
                  content: const Text(
                      'Você tem certeza que deseja excluir essa Tarefa?'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text(
                          'CANCELAR',
                          style: TextStyle(color: Colors.grey[400]),
                        )),
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text(
                          'EXCLUIR',
                          style: TextStyle(color: AppColors.accentColorLight),
                        )),
                  ],
                );
              });
        }

        if (direction == DismissDirection.endToStart) {
          return await showDialog(
              context: context,
              builder: (BuildContext ctx) {
                return AlertDialog(
                  title: const Text('Mover para Tarefas Concluídas'),
                  content: const Text(
                      'Você tem certeza que deseja concluir essa Tarefa?'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text(
                          'CANCELAR',
                          style: TextStyle(color: Colors.grey[400]),
                        )),
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text(
                          'MOVER',
                          style: TextStyle(color: AppColors.accentColorLight),
                        )),
                  ],
                );
              });
        }
      },
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          _deleteTodo(context, todo);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Tarefa excluída com sucesso"),
              backgroundColor: AppColors.successColorLight,
            ),
          );
        }

        if (direction == DismissDirection.endToStart) {
          final newTodo =
              todo.copyWith(isCompleted: 1, completedDate: DateTime.now());
          _changeTodoState(context, newTodo);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Tarefa movida com sucesso"),
              backgroundColor: AppColors.successColorLight,
            ),
          );
        }
      },
      background: Container(
        color: Colors.red[100],
        child: Icon(
          Icons.delete,
          color: Colors.red[400],
        ),
      ),
      secondaryBackground: Container(
        color: Colors.blue[100],
        child: Icon(
          Icons.done,
          color: Colors.blueAccent[700],
          size: 30,
        ),
      ),
      child: ListTile(
        onTap: () {
          showModalBottomSheet<void>(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              context: context,
              isScrollControlled: true,
              builder: (BuildContext ctx) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: EditTodoWidget(
                    todo: todo,
                  ),
                );
              });
        },
        title: Text(
          todo.description,
          style: AppTextStyle.smallTitleTile,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          'Criada em: ${DateFormat('dd/MM/yyyy').format(todo.creationDate)}',
          style: AppTextStyle.smallSubtitleTile,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  void _deleteTodo(BuildContext context, TodoModel todo) {
    context.read<TodosCubit>().deleteTodo(todo);
    context.read<TodosCubit>().fetchTodos();
  }

  void _changeTodoState(BuildContext context, TodoModel newTodo) {
    context.read<TodosCubit>().updateTodo(newTodo);
    context.read<TodosCubit>().fetchTodos();
  }
}
