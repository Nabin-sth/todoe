import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state/screens/task_screen.dart';
import 'package:state/task_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // late Function call = TaskView() as Function;
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TasksScreen(callback: () {
        print("neww");
      }),
      debugShowCheckedModeBanner: false,
    );
  }
}
