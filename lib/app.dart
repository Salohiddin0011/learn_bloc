import 'package:flutter/material.dart';
import 'package:learn_bloc/main.dart';
import 'package:learn_bloc/pages/first_page.dart';
import 'package:learn_bloc/pages/todo_home.dart';

class LearnBloc extends StatelessWidget {
  const LearnBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeMode>(
        stream: theme.stream,
        initialData: theme.state,
        builder: (context, snapshot) {
          return MaterialApp(
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            themeMode: theme.state,
            home: const Home(),
          );
        });
  }
}
