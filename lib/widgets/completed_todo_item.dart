import 'package:bloc_studies/cubit/completed_todo_cubit.dart';
import 'package:bloc_studies/cubit/todo_cubit.dart';
import 'package:bloc_studies/models/todo_model.dart';
import 'package:bloc_studies/theme/app_colors.dart';
import 'package:bloc_studies/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CompletedTodoItemWidget extends StatefulWidget {
  final TodoModel? todo;
  const CompletedTodoItemWidget({Key? key, this.todo}) : super(key: key);

  @override
  State<CompletedTodoItemWidget> createState() =>
      _CompletedTodoItemWidgetState();
}

class _CompletedTodoItemWidgetState extends State<CompletedTodoItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.todo!.id!),
      confirmDismiss: (DismissDirection direction) async {
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
                      child: const Text('CANCELAR')),
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('EXCLUIR')),
                ],
              );
            });
      },
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          _deleteCompletedTodos(context, widget.todo!);
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Tarefa excluída com sucesso"),
            backgroundColor: AppColors.successColorLight,
          ),
        );
      },
      background: Container(
        color: Colors.red[100],
        child: Icon(
          Icons.delete,
          color: Colors.red[400],
        ),
      ),
      child: ListTile(
        title: Text(
          widget.todo!.description,
          style: AppTextStyle.smallTitleTile,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          'Finalizada em: ${DateFormat('dd/MM/yyyy').format(widget.todo!.completedDate!)}',
          style: AppTextStyle.smallSubtitleTile,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  void _deleteCompletedTodos(BuildContext context, TodoModel todo) {
    context.read<TodosCubit>().deleteTodo(todo);
    context.read<CompletedTodoCubit>().fetchCompletedTodos();
  }
}
