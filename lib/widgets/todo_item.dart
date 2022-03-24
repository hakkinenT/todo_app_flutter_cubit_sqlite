import 'package:bloc_studies/cubit/todo_cubit.dart';
import 'package:bloc_studies/models/todo_model.dart';
import 'package:bloc_studies/theme/app_colors.dart';
import 'package:bloc_studies/theme/app_text_styles.dart';
import 'package:bloc_studies/utils/convert_bool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckListTileTodosWidget extends StatefulWidget {
  final TodoModel? todo;
  const CheckListTileTodosWidget({Key? key, this.todo}) : super(key: key);

  @override
  State<CheckListTileTodosWidget> createState() =>
      _CheckListTileTodosWidgetState();
}

class _CheckListTileTodosWidgetState extends State<CheckListTileTodosWidget> {
  late bool _isSelected;

  @override
  void didChangeDependencies() {
    final isCompleted = ConvertBool.convertIntToBool(widget.todo!.isCompleted!);
    _isSelected = isCompleted;

    super.didChangeDependencies();
  }

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
          _deleteTodo(context, widget.todo!);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Tarefa excluída com sucesso"),
              backgroundColor: AppColors.successColorLight,
            ),
          );
        }

        if (direction == DismissDirection.endToStart) {
          final newTodo = widget.todo!
              .copyWith(isCompleted: 1, completedDate: DateTime.now());
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
        title: Text(
          widget.todo!.description,
          style: AppTextStyle.smallTitleTile,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          'Criada em: ${DateFormat('dd/MM/yyyy').format(widget.todo!.creationDate)}',
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
    context.read<TodosCubit>().changeTodoStatus(newTodo);
    context.read<TodosCubit>().fetchTodos();
  }
}
