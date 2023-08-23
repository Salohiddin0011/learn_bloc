import 'package:flutter/material.dart';
import 'package:learn_bloc/main.dart';

class Detail extends StatelessWidget {
  Detail({super.key});
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('createTodo'),
        actions: [
          IconButton(
            onPressed: () {
              todoCubit.createTodo(
                  titleController.text.trim(), descController.text.trim());

              Navigator.pop(context);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(hintText: 'Title'),
            ),
            SizedBox(height: 15),
            TextField(
              controller: descController,
              decoration: InputDecoration(hintText: 'Description'),
            ),
          ],
        ),
      ),
    );
  }
}
