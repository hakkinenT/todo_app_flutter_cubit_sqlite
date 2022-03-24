import 'package:bloc_studies/animations/fade_transition_animation_widget.dart';
import 'package:bloc_studies/animations/slide_transition_animation_widget.dart';
import 'package:bloc_studies/theme/app_images.dart';
import 'package:bloc_studies/theme/app_text_styles.dart';
import 'package:bloc_studies/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SlideTransitionAnimationWidget(
                child: AspectRatio(
                  aspectRatio: 12 / 9,
                  child: SvgPicture.asset(AppImages.todoList),
                ),
                curve: Curves.bounceInOut,
                duration: const Duration(seconds: 3),
                begin: const Offset(-1.0, 0.0),
                end: Offset.zero),
            FadeTransitionAnimationWidget(
                child: Text('Crie Tarefas para organizar seu dia a dia.',
                    style: AppTextStyle.smallTitle,
                    textAlign: TextAlign.center),
                curve: Curves.easeIn,
                duration: const Duration(seconds: 3)),
            const SizedBox(
              height: 20,
            ),
            FadeTransitionAnimationWidget(
                child: FittedBox(
                  child: Text(
                    'Clique em COMEÇAR para criar sua primeira Tarefa.',
                    style: AppTextStyle.smallSubtitle,
                    textAlign: TextAlign.center,
                  ),
                ),
                curve: Curves.easeIn,
                duration: const Duration(seconds: 3)),
            const SizedBox(
              height: 50,
            ),
            FadeTransitionAnimationWidget(
                child: SizedBox(
                  height: size.height / 13,
                  width: size.width * 0.9,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, homePage);
                      },
                      child: const Text(
                        'COMEÇAR',
                      )),
                ),
                curve: Curves.easeInBack,
                duration: const Duration(seconds: 3))
          ],
        ),
      ),
    );
  }
}
