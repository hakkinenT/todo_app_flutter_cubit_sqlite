import 'package:bloc_studies/models/todo_model.dart';
import 'package:bloc_studies/theme/app_colors.dart';
import 'package:bloc_studies/theme/app_text_styles.dart';
import 'package:bloc_studies/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class EditTodoWidget extends StatelessWidget {
  final TodoModel todo;
  const EditTodoWidget({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 4,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(5)),
              )),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              'Editar Tarefa',
              style: AppTextStyle.smallLabel,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20),
            child: CustomTextField(
              isEditing: true,
              todo: todo,
            ),
          ),
        ],
      ),
    );
  }
}
