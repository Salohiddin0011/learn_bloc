import 'package:flutter/material.dart';
import 'package:learn_bloc/main.dart';
import 'package:learn_bloc/pages/second_page.dart';

import '../models/todo.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Detail()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: StreamBuilder<List<Todo>>(
        initialData: todoCubit.state,
        stream: todoCubit.stream,
        builder: (context, _) {
          return ListView.builder(
            itemCount: todoCubit.state.length,
            itemBuilder: (context, index) {
              final todo = todoCubit.state[index];
              return ListTile(
                title: Text(todo.title),
                subtitle: Text(todo.description),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    todoCubit.deleteTodo(todo);
                  },
                ),
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) {
                    todoCubit.complete(todo);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
