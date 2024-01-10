import 'package:flutter/material.dart';
import 'package:state/screens/task_screen.dart';
import 'package:state/task_list.dart';

class Task {
  late final String task;
  final bool isDone = false;

  Task({required this.task});
}

class TaskView extends StatefulWidget {
  List<Task> tasks = [];
  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  late String taskname;

  void addtask(String taskName) {
    setState(() {
      taskname = taskName;
    });
  }
  // void addTask(String taskName) {
  //   setState(() {
  //   });
  // }
  // void addTaskCallback(String taskName) {
  //   setState(() {
  //     widget.tasks.add(Task(task: taskName));
  //   });
  // widget.(taskName);
  // widget.tasks.add(Task(task: taskName));
  // }

  @override
  @override
  Widget build(BuildContext context) {
    // if()
    return ListView.builder(
      itemBuilder: (context, index) {
        TasksScreen(callback: addtask);

        return Tasklist(
          task: widget.tasks[index].task,
          isChecked: widget.tasks[index].isDone,
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
