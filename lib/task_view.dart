import 'package:flutter/material.dart';
import 'package:state/screens/task_screen.dart';
import 'package:state/task_list.dart';

class Task {
  late final String task;
  final bool isDone = false;
  Task({required this.task});
}

class TaskView extends StatefulWidget {
  String? taskname;
  List<Task> tasks = [Task(task: "hello"), Task(task: "task")];
  Function? callback;

  void getdata(String task) {
    taskname = task;
    if ((taskname) != null) {
      // setState(() {
      tasks.add(Task(task: (taskname)!));
      // print(tasks.length);
      // print(taskname);
      Widget.build;

      // });
    }
  }

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  @override
  Widget build(BuildContext context) {
    print(widget.tasks.length);
    if ((widget.taskname) != null) {
      print(widget.taskname);
      setState(() {
        widget.tasks.add(Task(task: (widget.taskname)!));
      });
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        return Tasklist(
          task: widget.tasks[index].task,
          isChecked: widget.tasks[index].isDone,
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
