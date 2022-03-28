import 'package:bloc_studies/models/todo_model.dart';
import 'package:bloc_studies/widgets/todo_item.dart';
import 'package:flutter/material.dart';

class TodosListWidget extends StatelessWidget {
  final List<TodoModel> todos;
  const TodosListWidget({Key? key, required this.todos}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTileTodosWidget(
            todo: todos[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 5,
            ),
        itemCount: todos.length);
    ;
  }
}
