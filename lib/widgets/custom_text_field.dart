import 'package:bloc_studies/cubit/todo_cubit.dart';
import 'package:bloc_studies/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextField extends StatefulWidget {
  final TodoModel? todo;
  final bool isEditing;
  const CustomTextField({Key? key, required this.isEditing, this.todo})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final _todoController = TextEditingController();

  @override
  void initState() {
    if (widget.isEditing) {
      _todoController.text = widget.todo!.description;
    }
    super.initState();
  }

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 4,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                widget.isEditing
                    ? IconButton(
                        onPressed: () {
                          final newTodo = widget.todo!
                              .copyWith(description: _todoController.text);
                          _updateTodo(context, newTodo);
                          _focusControl(context);
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.edit))
                    : IconButton(
                        onPressed: () {
                          _submitTarefa(context, _todoController.text);
                          _focusControl(context);
                          _todoController.clear();
                        },
                        icon: const Icon(Icons.add_box)),
                const SizedBox(width: 6.0),
                Expanded(
                    child: TextField(
                  autofocus: widget.isEditing ? true : false,
                  controller: _todoController,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "Adicione um Tarefa"),
                ))
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _submitTarefa(BuildContext context, String description) {
    final todoCubit = context.read<TodosCubit>();
    final todo =
        TodoModel(description: description, creationDate: DateTime.now());
    todoCubit.addTodo(todo);
    todoCubit.fetchTodos();
  }

  void _focusControl(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void _updateTodo(BuildContext context, TodoModel newTodo) {
    context.read<TodosCubit>().updateTodo(newTodo);
    context.read<TodosCubit>().fetchTodos();
  }
}
