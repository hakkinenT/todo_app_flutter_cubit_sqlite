import 'package:bloc_studies/theme/app_images.dart';
import 'package:bloc_studies/theme/app_text_styles.dart';
import 'package:bloc_studies/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
      child: Column(
        children: [
          const CustomTextField(
            isEditing: false,
          ),
          const SizedBox(
            height: 35,
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: SvgPicture.asset(AppImages.noteList),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(right: 25, left: 25),
            child: Text(
              'A sua  lista de Tarefas está vazia.',
              textAlign: TextAlign.center,
              style: AppTextStyle.smallTitle,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: FittedBox(
              child: Text(
                'Adicione uma Tarefa para começar!',
                textAlign: TextAlign.center,
                style: AppTextStyle.smallSubtitle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
