import 'package:bloc_studies/cubit/completed_todo_cubit.dart';
import 'package:bloc_studies/cubit/todo_cubit.dart';
import 'package:bloc_studies/di/service_locator.dart';
import 'package:bloc_studies/repository/itodos_repository.dart';
import 'package:bloc_studies/router.dart';
import 'package:bloc_studies/theme/todos_app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.router}) : super(key: key);
  final AppRouter? router;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => TodosCubit(getIt<ITodosRepository>())),
          BlocProvider(
              create: (_) => CompletedTodoCubit(getIt<ITodosRepository>()))
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: const [Locale('pt', 'BR')],
          debugShowCheckedModeBanner: false,
          theme: TodosAppTheme.light,
          onGenerateRoute: router!.generateRoute,
        ));
  }
}
