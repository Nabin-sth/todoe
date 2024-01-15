import 'package:flutter/material.dart';
import 'package:state/screens/task_screen.dart';
import 'package:state/task_list.dart';

class Task {
  late final String task;
  final bool isDone = false;

  Task({required this.task});
}

class TaskView extends StatefulWidget {
  late List tasks;
  TaskView({required this.tasks});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    // if()
    print(widget.tasks.length);
    return ListView.builder(
      itemBuilder: (context, index) {
        // TasksScreen(callback: addtask);

        return Tasklist(
          task: widget.tasks[index].task,
          isChecked: widget.tasks[index].isDone,
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
