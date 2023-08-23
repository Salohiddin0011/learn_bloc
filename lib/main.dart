import 'package:flutter/material.dart';
import 'package:learn_bloc/app.dart';
import 'package:learn_bloc/cubit/counter_cubit.dart';
import 'package:learn_bloc/cubit/theme_cubit.dart';
import 'package:learn_bloc/cubit/todo_cubit.dart';

final count = CounterCubit(0);
final theme = ThemeCubit();
final todoCubit = TodoCubit([]);
void main() {
  runApp(const LearnBloc());
}
