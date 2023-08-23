import 'package:bloc/bloc.dart';
import 'package:learn_bloc/models/todo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit(super.initialState);
  void createTodo(String title, String desc) {
    final todo = Todo(
        title: title,
        description: desc,
        id: state.length + 1,
        isCompleted: false);
    emit([...state, todo]);
  }

  void deleteTodo(Todo todo) {
    state.remove(todo);
    emit([...state]);
  }

  void complete(Todo todo) {
    final index = state.indexOf(todo);
    todo.isCompleted = !todo.isCompleted;
    state.replaceRange(index, index + 1, [todo]);
    emit([...state]);
  }
}
