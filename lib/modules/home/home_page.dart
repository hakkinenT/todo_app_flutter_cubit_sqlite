import 'package:bloc_studies/cubit/todo_cubit.dart';
import 'package:bloc_studies/cubit/todo_state.dart';

import 'package:bloc_studies/models/todo_model.dart';
import 'package:bloc_studies/modules/completed_todos/completed_todos_page.dart';

import 'package:bloc_studies/theme/app_colors.dart';
import 'package:bloc_studies/widgets/custom_text_field.dart';
import 'package:bloc_studies/widgets/empty_list.dart';
import 'package:bloc_studies/widgets/todos_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void didChangeDependencies() {
    context.read<TodosCubit>().fetchTodos();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO App'),
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<TodosCubit, TodosState>(builder: (context, state) {
        if (_selectedIndex == 0) {
          if (state is TodosInitial) {
            return const EmptyListWidget();
          } else if (state is TodosLoaded) {
            return HomeView(
              todos: state.todos,
            );
          } else {
            return const Center(
              child:
                  CircularProgressIndicator(color: AppColors.accentColorLight),
            );
          }
        } else {
          return const CompletedTodosPage();
        }
      }, listener: (context, state) {
        if (state is TodosAdded) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Tarefa adicionada com sucesso!'),
            backgroundColor: AppColors.successColorLight,
            duration: Duration(milliseconds: 700),
          ));
        }
        if (state is TodoError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
            duration: const Duration(milliseconds: 700),
          ));
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.done), label: 'Tarefas Concluídas')
          ]),
    );
  }
}

class HomeView extends StatefulWidget {
  final List<TodoModel> todos;
  const HomeView({Key? key, required this.todos}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DateTime? _lastQuitTime;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_lastQuitTime == null ||
            DateTime.now().difference(_lastQuitTime!).inSeconds > 1) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Pressione o botão Voltar novamente.'),
            duration: Duration(seconds: 1),
          ));
          _lastQuitTime = DateTime.now();
          return false;
        } else {
          Navigator.of(context).pop(true);
          return true;
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
        child: ListView(
          children: [
            const CustomTextField(),
            const SizedBox(
              height: 35,
            ),
            TodosListWidget(
              todos: widget.todos,
            )
          ],
        ),
      ),
    );
  }
}
