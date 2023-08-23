import 'package:flutter/material.dart';

import 'package:learn_bloc/main.dart';

import '../cubit/counter_cubit.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
        actions: [
          StreamBuilder<ThemeMode>(
              initialData: theme.state,
              stream: theme.stream,
              builder: (context, _) {
                return IconButton(
                  onPressed: () {
                    theme.change();
                  },
                  icon: theme.state == ThemeMode.light
                      ? Icon(Icons.light_mode)
                      : Icon(Icons.dark_mode),
                );
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: count.decrement,
                icon: Icon(Icons.remove),
              ),
              SizedBox(width: 15),
              StreamBuilder(
                initialData: count.state,
                stream: count.stream,
                builder: (context, snapshot) {
                  return Text(
                    count.state.toString(),
                    style: TextStyle(fontSize: 50),
                  );
                },
              ),
              SizedBox(width: 15),
              IconButton(
                onPressed: count.increment,
                icon: Icon(Icons.add),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class CubitBuilder extends StatefulWidget {
//   final int state;
//   const CubitBuilder({super.key, required this.state});

//   @override
//   State<CubitBuilder> createState() => _CubitBuilderState();
// }

// class _CubitBuilderState extends State<CubitBuilder> {
//   @override
//   void didUpdateWidget(CubitBuilder oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.state != widget.state) {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       widget.state.toString(),
//       style: const TextStyle(
//         fontSize: 28,
//         fontWeight: FontWeight.w700,
//       ),
//     );
//   }
// }
